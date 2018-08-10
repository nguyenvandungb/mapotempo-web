/* global bootstrap_dialog modal_options */
var planningsShow = function(params) {
  'use strict';

  var templateVehicle = function(vehicle) {
    if (vehicle.id)
      return $("<span><span class='color_small' style='background: " + params.vehicles[parseInt(vehicle.id)].color + "'></span>&nbsp;</span>").append($("<span/>").text(vehicle.text));
  };

  var getSelectedVisits = function() {
    return $('#visits').find('input:checkbox:visible:checked');
  };

  var getSelectedPlannings = function(objName) {
    var visits = getSelectedVisits();
    var list = [];
    for (var index = 0; index < visits.length; index++) {
      if (!list[$(visits[index]).data('planning')]) list[$(visits[index]).data('planning')] = [];
      list[$(visits[index]).data('planning')].push($(visits[index]).data(objName));
    }
    return list;
  };

  var movedDestinations;
  var countMovedDestinations = function(max) {
    movedDestinations++;
    if (movedDestinations == max) location.href = '';
  };

  var getQuantitiesByPlanning = function() {
    var quantitiesByPlanning = $('#visits .stop-id:checked:visible');
    var selectedStops = {};
    for (var index = 0; index < quantitiesByPlanning.length; index++) {
      var stopId = $(quantitiesByPlanning[index]).data('stop');
      var planningId = $(quantitiesByPlanning[index]).data('planning');
      var quantitiesElements = $('.quantity-' + stopId);
      var quantities = [];
      for (var idx = 0; idx < quantitiesElements.length; idx++) {
        var $quantity = $(quantitiesElements[idx]);
        quantities.push({
          quantity_float: parseFloat($quantity.data('quantity')),
          deliverable_unit_id: $quantity.data('deliverable-unit-id'),
          unit_icon: $quantity.data('unit-icon')
        });
      }
      if (selectedStops[planningId]) {
        selectedStops[planningId].quantities.forEach(function(quantity) {
          quantities.forEach(function(qt) {
            if (quantity.deliverable_unit_id == qt.deliverable_unit_id)
              quantity.quantity_float += qt.quantity_float;
          });
        });
      } else {
        selectedStops[planningId] = {
          planningId: planningId,
          take_over: null,
          quantities: quantities
        };
      }
    }
    return selectedStops;
  };

  var getStopsToMoveByPlanning = function() {
    var stopsToMoveByPlanning = {};
    var stopsToMoveByPlanningElement = $('#visits .stop-id:checked:visible');
    for (var index = 0; index < stopsToMoveByPlanningElement.length; index++) {
      var stopByPlanning = stopsToMoveByPlanningElement[index];
      if (stopsToMoveByPlanning[$(stopByPlanning).data('planning')]) {
        stopsToMoveByPlanning[$(stopByPlanning).data('planning')].push($(stopByPlanning).data('visit'));
      } else {
        stopsToMoveByPlanning[$(stopByPlanning).data('planning')] = [];
        stopsToMoveByPlanning[$(stopByPlanning).data('planning')].push($(stopByPlanning).data('visit'));
      }
    }
    return stopsToMoveByPlanning;
  };

  var getVehicleCapacities = function(vehicleId, planningId) {
    if (!vehicleId) return [];
    var capacities = params.vehiclesUsagesByPlanning[planningId][vehicleId];
    return Object.keys(capacities.default_capacities).map(function(id) {
      var quantity = params.quantitiesByPlanning[planningId].find(function(qua) { return qua.id === parseInt(id); });
      if (quantity) return {id: id, capacity: capacities.default_capacities[id], label: quantity.label, unitIcon: quantity.unit_icon};
    }).filter(function(element) { return element; });
  };

  var getVehicleQuantities = function(vehicleId, planningId) {
    if (!vehicleId) return [];
    return [{ quantities: params.vehiclesUsagesByPlanning[planningId][vehicleId].vehicle_quantities }];
  };

  var modifyVehicle = function($vehicleElement, planningId, visitId) {
    $('.vehicle-color[data-planning-id="' + planningId + '"][data-visit-id="' + visitId + '"]')
      .css('background', $vehicleElement.data('color'));
    $('.vehicle-name[data-planning-id="' + planningId + '"][data-visit-id="' + visitId + '"]')
      .html($vehicleElement.html());
  };

  var cleanUncheckedQuantities = function() {
    var uncheckedVisits = $('#visits .stop-id:visible:not(:checked)');
    for (var index = 0; index < uncheckedVisits.length; index++) {
      var $element = $(uncheckedVisits[index]);
      $('.vehicle-projected-quantities[data-planning-id="' + $element.data('planning') + '"][data-visit-id="' + $element.data('visit') + '"]').empty();
    }
  };

  var calculateCapacities = function() {
    cleanUncheckedQuantities();
    var quantitiesByPlanning = getQuantitiesByPlanning();
    var $vehicleElement = $('#vehicle-id').find(":selected");
    if (!$vehicleElement.attr('data-id')) return;
    Object.keys(quantitiesByPlanning).forEach(function(planningId) {
      var visitToMove = quantitiesByPlanning[planningId];
      var stopsToMoveByPlanning = getStopsToMoveByPlanning();
      stopsToMoveByPlanning[planningId].forEach(function(visitId) {
        modifyVehicle($vehicleElement, planningId, visitId);
        var quantitiesToCalculate = $('.vehicle-projected-quantities[data-planning-id="' + planningId + '"][data-visit-id="' + visitId + '"]');
        for (var qtIndex = 0; qtIndex < quantitiesToCalculate.length; qtIndex++) {
          var $element = $(quantitiesToCalculate[qtIndex]);
          var vehicleId = $vehicleElement.val();
          var vehicleCapacities = getVehicleCapacities(vehicleId, planningId);
          var globalVisits = getVehicleQuantities(vehicleId, planningId);
          globalVisits.push(visitToMove);
          $element.empty();
          $element.fillQuantities({
            vehicleCapacities: vehicleCapacities,
            stops: globalVisits,
            controllerParamsQuantities: params.quantitiesByPlanning[planningId],
            withCapacity: true,
          });
        }
      });
    });
  };

  $('#affect-destinations').click(function() {
    var vehicleId = parseInt($('#vehicle-id').find(":selected").val());
    var dialog = bootstrap_dialog($.extend(modal_options(), {
      title: I18n.t('plannings.edit.dialog.move_destinations.title'),
      message: SMT['modals/default_with_progress']({
        msg: I18n.t('plannings.edit.dialog.move_destinations.in_progress')
      })
    }));
    dialog.modal({ keyboard: false, show: true });

    movedDestinations = 0;
    var selectedPlannings = getSelectedPlannings('visit');
    selectedPlannings.forEach(function(stopIds, planningId) {
      var routeId = params.routesByVehiclesByPlanning[planningId][vehicleId];
      $.ajax({
        type: 'PATCH',
        dataType: 'json',
        url: '/api/0.1/plannings/' + planningId + '/routes/' + routeId + '/visits/moves',
        data: { 'visit_ids': stopIds },
        beforeSend: beforeSendWaiting,
        error: function(request, status, error) {
          dialog.modal('hide');
          ajaxError(request, status, error);
          completeWaiting();
        },
        success: function() { countMovedDestinations(Object.keys(selectedPlannings).length); }
      });
    });
  });

  $('#automatic-insert').click(function() {
    var dialog = bootstrap_dialog($.extend(modal_options(), {
      title: I18n.t('plannings.edit.dialog.automatic_insert.title'),
      message: SMT['modals/default_with_progress']({
        msg: I18n.t('plannings.edit.dialog.automatic_insert.in_progress')
      })
    }));
    dialog.modal({ keyboard: false, show: true });

    movedDestinations = 0;
    var selectedPlannings = getSelectedPlannings('stop');
    selectedPlannings.forEach(function(stopIds, planningId) {
      $.ajax({
        type: 'PATCH',
        dataType: 'json',
        url: '/api/0.1/plannings/' + planningId + '/automatic_insert',
        data: { 'stop_ids': stopIds },
        beforeSend: beforeSendWaiting,
        error: function(request, status, error) {
          dialog.modal('hide');
          ajaxError(request, status, error);
          completeWaiting();
        },
        success: function() { countMovedDestinations(Object.keys(selectedPlannings).length); }
      });
    });
  });

  $('#vehicle-id').select2({
    templateSelection: templateVehicle,
    templateResult: templateVehicle
  }).change(function() { calculateCapacities(); });
  $('#visits_filter').on('table.filtered', function() { 
    calculateCapacities();
  });
  $('#visits .stop-id').change(function() { calculateCapacities(); });
};

$(document).ready(function() {
  $('.overflow').css('max-height', ($(document).height() - 390) + 'px');
});

Paloma.controller('PlanningsByDestinations', {
  show: function() {
    planningsShow(this.params);
  }
});

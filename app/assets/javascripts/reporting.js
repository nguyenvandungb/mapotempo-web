
var reporting_index = function() {
  'use strict';

  $('.reporting-form').submit(function(e) {
    e.preventDefault();
    var begin_date = $('#_begin_date').val();
    var end_date = $('#_end_date').val();
    var customer_id = $('#_customer_id').val();

    $.ajax({
      type: 'GET',
      url: '/api/0.1/devices/fleet/reporting.csv',
      data: {
        customer_id: customer_id,
        begin_date: begin_date,
        end_date: end_date,
        with_actions: $('#_with_actions').is(':checked'),
        locale: I18n.currentLocale()
      },
      xhrFields: {
        responseType: 'blob'
      },
      headers: {
        contentType: 'application/csv; charset=utf-8'
      },
      success: function(data, textStatus, xhr) {
        var a = document.createElement('a');
        var url = window.URL.createObjectURL(data);
        document.body.appendChild(a);
        a.href = url;
        a.download = 'reporting.csv';
        a.click();
        window.URL.revokeObjectURL(url);
        $('#download-reporting').prop('disabled', false);
        $('#download-reporting').text(I18n.t('reporting.download.retry'));
        notice(I18n.t('reporting.download.success'));
      },
      error: function() {
        if (end_date - begin_date > 31) {
          stickyError(I18n.t('reporting.download.max_interval_reached'));
        } else if (begin_date > end_date) {
          stickyError(I18n.t('reporting.download.end_date_inferior'));
        } else {
          stickyError(I18n.t('reporting.download.fail'));
        }
        $('#download-reporting').prop('disabled', false);
        $('#download-reporting').text(I18n.t('reporting.download.retry'));
      }
    });
  });
};

Paloma.controller('Reporting', {
  index: function() {
    reporting_index(this.params);
  }
});

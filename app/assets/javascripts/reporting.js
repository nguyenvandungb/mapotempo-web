
var reporting_index = function() {
  'use strict';

  $('.reporting-form').submit(function(e) {
    e.preventDefault();
    var beginDate = $('#_begin_date').val();
    var endDate = $('#_end_date').val();
    var customerId = $('#_customer_id').val();

    $.ajax({
      type: 'GET',
      url: '/api/0.1/devices/fleet/reporting.csv',
      data: {
        customer_id: customerId,
        begin_date: beginDate,
        end_date: endDate,
        with_actions: $('#_with_actions').is(':checked'),
        locale: I18n.currentLocale()
      },
      headers: {
        contentType: 'application/csv; charset=utf-8'
      },
      success: function(data, _textStatus, xhr) {
        var blob = new Blob([data], {type: 'text/csv'});
        var filename = 'reporting.csv';
        if (xhr.status === 204) {
          notice(I18n.t('reporting.download.no_content'));
        } else {
          if (navigator.msSaveBlob) {
            navigator.msSaveBlob(blob, filename);
          } else {
            var a = document.createElement('a');
            var url = window.URL.createObjectURL(blob);
            document.body.appendChild(a);
            a.href = url;
            a.download = filename;
            a.click();
            window.URL.revokeObjectURL(url);
          }
          notice(I18n.t('reporting.download.success'));
        }
        $('#download-reporting').prop('disabled', false);
        $('#download-reporting').text(I18n.t('reporting.download.retry'));
      },
      error: function(xhr) {
        stickyError(xhr.responseText);
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

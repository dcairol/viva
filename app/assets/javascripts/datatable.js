window.viva = window.viva || {};

window.viva.to_datatable = function to_datatable(selector,opciones){

    var val,
      element,
      filtro,
      success,
      datatable,
      search_box;

    element = $(selector);
    filtro = opciones.filtro;

    datatable = element.dataTable({
      bJQueryUI: true,
      bServerSide: true,
      bProcessing: true,
      sAjaxSource: element.data('source'),
      iDisplayLength: opciones.display_length || null
    });

    if(typeof filtro !== 'undefined'){
      search_box = $(selector + '_filter input')
      success = function success(data){
        if(data.success){
          datatable.fnFilter(search_box.val());
        }
      };

      filtro.on('change',function(){
        val = $(this).val();
        $.ajax({
          url: opciones.filtro_url,
          data: {filter: val},
          dataType: 'json',
          success: success
        });
      });
    }

    return element;
};
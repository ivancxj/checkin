//=  require jquery
//=  require jquery_ujs
//=  require rails_admin/jquery.remotipart.fixed
//=  require jquery-ui/effect
//=  require jquery-ui/sortable
//=  require jquery-ui/autocomplete
//=  require jquery-ui/datepicker
//=  require rails_admin/jquery.ui.timepicker
//=  require rails_admin/ra.datetimepicker
//=  require rails_admin/jquery.colorpicker
//=  require rails_admin/ra.filter-box
//=  require rails_admin/ra.filtering-multiselect
//=  require rails_admin/ra.filtering-select
//=  require rails_admin/ra.remote-form
//=  require rails_admin/jquery.pjax
//=  require rails_admin/ra.nested-form-hooks
//=  require rails_admin/ra.i18n
//=  require rails_admin/bootstrap/bootstrap
//=  require rails_admin/ra.widgets
//=  require rails_admin/ui
//=  require rails_admin/custom/ui

//在角色编辑权限时,全选|清除checkbox
function checkAll(id, checked) {
    $('#'+id).find('input[type=checkbox]:enabled').prop('checked', checked);
}

function hideOnLoad() {
    $('.hol').hide();
}

$(document).ready(hideOnLoad);

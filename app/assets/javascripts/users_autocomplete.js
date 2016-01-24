$(document).ready(function(){

  var template = 
  ['<li class="collection-item avatar">',
    '<img src="{{image}}" alt="" class="square">',
    '<span class="title">{{name}}</span>',
    '<p>{{email}}</p>',
  '</li>'].join("\n");
  
  var tpl = Handlebars.compile(template);

  $( "#search" ).autocomplete({
    source: "/users/autocomplete",
    minLength: 1,
    select: function( event, ui ) {
      window.location = ui.item.url;
    }
  }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
    ul.addClass('collection');
    return $(tpl(item)).appendTo(ul);
  };
});

$("#search").focus(function(){
  if($(this).val() !== "" || $(this).val() !== undefined) {
    $(this).autocomplete("search", $(this).val());  
  }
});
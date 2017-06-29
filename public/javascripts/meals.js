$("#meals tr").click(function() {
  if(this.classList.contains('selected') == true){
    $(this).removeClass('selected');
  } else {
    if($('.selected').length >= 3) {
      alert('You can choose only 3 items');
      return;
    } else {
      $(this).addClass('selected').siblings();
    }
  }

  var courses = [];
  var meals = [];

  $.each($('.selected'), function(i, value) {
    courses.push($(value).find('td:eq(2)').html());
    meals.push($(value).find('td:first').html());
  })

  if (((new Set(courses)).size !== courses.length) == true) {
    $(this).removeClass('selected');
    alert('You can choose only one item from each course');
    return;
  }
});

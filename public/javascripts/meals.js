$('#meals tr').click(function() {
  if(this.classList.contains('selected') == true) {
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

$('#submit').click(function() {
  if($('.selected').length != 3) {
    alert('You must choose 3 meals');
    return false;
  }
  var meals = [];
  $.each($('.selected'), function(i, value) {
    meals.push('&meals[]=' + $(value).find('td:first').html());
  });

  var url = $('#submit').attr('href');
  $.each(meals, function(i, value) {
    url = url + value;
  });
  $('#submit').attr('href', url);
});

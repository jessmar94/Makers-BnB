$( ".datepicker_start" ).datepicker({
  dateFormat: "yy-mm-dd",
	inline: true,
  beforeShowDay: function(date) {
    var dd = date.getDate();
    var mm = date.getMonth()+1;
    var yyyy = date.getFullYear();
    var shortDate = mm+'/'+dd+'/'+yyyy;

    if ($.inArray(shortDate, availabilityDates) != -1) {
            return [true, "","Available"];
        } else{
             return [false,"","unAvailable"];
        }
  }
});

$( ".datepicker_end" ).datepicker({
  dateFormat: "yy-mm-dd",
	inline: true,
  beforeShowDay: function(date) {
    var dd = date.getDate();
    var mm = date.getMonth()+1;
    var yyyy = date.getFullYear();
    var shortDate = mm+'/'+dd+'/'+yyyy;

    if ($.inArray(shortDate, availabilityDates) != -1) {
            return [true, "","Available"];
        } else{
             return [false,"","unAvailable"];
        }
  }
});

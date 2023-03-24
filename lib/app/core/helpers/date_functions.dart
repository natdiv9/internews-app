String getNameOfMonth(DateTime date) {
  var month = date.month;

  switch (month) {
    case 1:
      return 'Janvier';
    case 2:
      return 'Février';
    case 3:
      return 'Mars';

    case 4:
      return 'Avril';
    case 5:
      return 'Mai';
    case 6:
      return 'Juin';
    case 7:
      return 'Juillet';
    case 8:
      return 'Août';
    case 9:
      return 'Septembre';
    case 10:
      return 'Octobre';
    case 11:
      return 'Novembre';
    case 12:
      return 'Décembre';
    default:
      return '';
  }
}

String formatedDate(String date) {
  var namedMonth = getNameOfMonth(DateTime.parse(date));
  var day = date.split('-')[2];
  var year = date.split('-')[0];
  return '$day $namedMonth $year';
}

String formatedDateWithTime(String date) {
  var namedMonth = getNameOfMonth(DateTime.parse(date));
  var day = date.split('T')[0].split('-')[2];
  var year = date.split('T')[0].split('-')[0];
  var hour = date.split('T')[1].split(':')[0];
  var min = date.split('T')[1].split(':')[1];
  return '$day $namedMonth $year à $hour:$min';
}

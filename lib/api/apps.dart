import 'dart:convert';

apiApps() {
  var data = [
    {"id": 0, "title": "User Rooms", "path": "rooms"},
    {"id": 1, "title": "Loan App", "path": "loans"}
  ];

  var resp = json.encode(data);
  return resp;
}

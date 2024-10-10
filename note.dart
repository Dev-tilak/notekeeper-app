class Note {
  int? _id;
  String _title;
  String? _description;
  String _date; // Keep this as non-nullable
  int _priority; // Keep this as non-nullable

  // Constructors
  Note(this._title, this._date, this._priority, [this._description])
      :
        assert(_priority >= 1 && _priority <= 2, 'Priority must be 1 or 2');

  Note.withId(this._id, this._title, this._date, this._priority, [this._description])
      : assert(_date.isNotEmpty, 'Date cannot be empty'),
        assert(_priority >= 1 && _priority <= 2, 'Priority must be 1 or 2');

  // Getters
  int? get id => _id;
  String get title => _title;
  String? get description => _description;
  int get priority => _priority;
  String get date => _date;

  // Setters
  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String? newDescription) {
    if (newDescription == null || newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    if (newDate.isNotEmpty) {
      _date = newDate;
    }
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    if (_id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map)
      : _id = map['id'],
        _title = map['title'],
        _description = map['description'],
        _priority = map['priority'] ?? 1, // Assign a default priority if null
        _date = map['date'] ?? DateTime.now().toIso8601String(); // Default to current date if null
}

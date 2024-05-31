// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a du locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'du';

  static String m0(count) =>
      "${Intl.plural(count, one: 'day ago', few: 'days ago', many: 'days ago', other: 'days ago')}";

  static String m1(count) =>
      "${Intl.plural(count, one: 'month ago', few: 'months ago', many: 'months ago', other: 'months ago')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "daysAgo": m0,
        "featured": MessageLookupByLibrary.simpleMessage("Featured"),
        "latestNews": MessageLookupByLibrary.simpleMessage("Latest news"),
        "markAllRead": MessageLookupByLibrary.simpleMessage("Mark all read"),
        "monthsAgo": m1,
        "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
        "today": MessageLookupByLibrary.simpleMessage("Today")
      };
}

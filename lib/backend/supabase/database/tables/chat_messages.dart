import '../database.dart';

class ChatMessagesTable extends SupabaseTable<ChatMessagesRow> {
  @override
  String get tableName => 'chat_messages';

  @override
  ChatMessagesRow createRow(Map<String, dynamic> data) => ChatMessagesRow(data);
}

class ChatMessagesRow extends SupabaseDataRow {
  ChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get chatId => getField<int>('chat_id');
  set chatId(int? value) => setField<int>('chat_id', value);

  String? get chatText => getField<String>('chat_text');
  set chatText(String? value) => setField<String>('chat_text', value);

  String? get chatPhoto => getField<String>('chat_photo');
  set chatPhoto(String? value) => setField<String>('chat_photo', value);

  String? get chatFile => getField<String>('chat_file');
  set chatFile(String? value) => setField<String>('chat_file', value);

  String? get chatVideo => getField<String>('chat_video');
  set chatVideo(String? value) => setField<String>('chat_video', value);

  String? get chatVoice => getField<String>('chat_voice');
  set chatVoice(String? value) => setField<String>('chat_voice', value);

  String? get createdbyId => getField<String>('createdby_id');
  set createdbyId(String? value) => setField<String>('createdby_id', value);

  String? get recipientId => getField<String>('recipient_id');
  set recipientId(String? value) => setField<String>('recipient_id', value);

  bool? get messageRead => getField<bool>('message_read');
  set messageRead(bool? value) => setField<bool>('message_read', value);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'todo.dart';

class PriorityMapper extends EnumMapper<Priority> {
  PriorityMapper._();

  static PriorityMapper? _instance;
  static PriorityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PriorityMapper._());
    }
    return _instance!;
  }

  static Priority fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Priority decode(dynamic value) {
    switch (value) {
      case r'low':
        return Priority.low;
      case r'normal':
        return Priority.normal;
      case r'high':
        return Priority.high;
      case r'urgent':
        return Priority.urgent;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Priority self) {
    switch (self) {
      case Priority.low:
        return r'low';
      case Priority.normal:
        return r'normal';
      case Priority.high:
        return r'high';
      case Priority.urgent:
        return r'urgent';
    }
  }
}

extension PriorityMapperExtension on Priority {
  String toValue() {
    PriorityMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Priority>(this) as String;
  }
}

class StatusMapper extends EnumMapper<Status> {
  StatusMapper._();

  static StatusMapper? _instance;
  static StatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StatusMapper._());
    }
    return _instance!;
  }

  static Status fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Status decode(dynamic value) {
    switch (value) {
      case r'notStarted':
        return Status.notStarted;
      case r'inProgress':
        return Status.inProgress;
      case r'completed':
        return Status.completed;
      case r'blocked':
        return Status.blocked;
      case r'cancelled':
        return Status.cancelled;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Status self) {
    switch (self) {
      case Status.notStarted:
        return r'notStarted';
      case Status.inProgress:
        return r'inProgress';
      case Status.completed:
        return r'completed';
      case Status.blocked:
        return r'blocked';
      case Status.cancelled:
        return r'cancelled';
    }
  }
}

extension StatusMapperExtension on Status {
  String toValue() {
    StatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Status>(this) as String;
  }
}

class ChecklistItemMapper extends ClassMapperBase<ChecklistItem> {
  ChecklistItemMapper._();

  static ChecklistItemMapper? _instance;
  static ChecklistItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChecklistItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChecklistItem';

  static String _$id(ChecklistItem v) => v.id;
  static const Field<ChecklistItem, String> _f$id = Field('id', _$id);
  static String _$title(ChecklistItem v) => v.title;
  static const Field<ChecklistItem, String> _f$title = Field('title', _$title);
  static bool _$done(ChecklistItem v) => v.done;
  static const Field<ChecklistItem, bool> _f$done = Field(
    'done',
    _$done,
    opt: true,
    def: false,
  );

  @override
  final MappableFields<ChecklistItem> fields = const {
    #id: _f$id,
    #title: _f$title,
    #done: _f$done,
  };

  static ChecklistItem _instantiate(DecodingData data) {
    return ChecklistItem(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      done: data.dec(_f$done),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static ChecklistItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChecklistItem>(map);
  }

  static ChecklistItem fromJson(String json) {
    return ensureInitialized().decodeJson<ChecklistItem>(json);
  }
}

mixin ChecklistItemMappable {
  String toJson() {
    return ChecklistItemMapper.ensureInitialized().encodeJson<ChecklistItem>(
      this as ChecklistItem,
    );
  }

  Map<String, dynamic> toMap() {
    return ChecklistItemMapper.ensureInitialized().encodeMap<ChecklistItem>(
      this as ChecklistItem,
    );
  }

  ChecklistItemCopyWith<ChecklistItem, ChecklistItem, ChecklistItem>
  get copyWith => _ChecklistItemCopyWithImpl<ChecklistItem, ChecklistItem>(
    this as ChecklistItem,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return ChecklistItemMapper.ensureInitialized().stringifyValue(
      this as ChecklistItem,
    );
  }

  @override
  bool operator ==(Object other) {
    return ChecklistItemMapper.ensureInitialized().equalsValue(
      this as ChecklistItem,
      other,
    );
  }

  @override
  int get hashCode {
    return ChecklistItemMapper.ensureInitialized().hashValue(
      this as ChecklistItem,
    );
  }
}

extension ChecklistItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChecklistItem, $Out> {
  ChecklistItemCopyWith<$R, ChecklistItem, $Out> get $asChecklistItem =>
      $base.as((v, t, t2) => _ChecklistItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChecklistItemCopyWith<$R, $In extends ChecklistItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? id, String? title, bool? done});
  ChecklistItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChecklistItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChecklistItem, $Out>
    implements ChecklistItemCopyWith<$R, ChecklistItem, $Out> {
  _ChecklistItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChecklistItem> $mapper =
      ChecklistItemMapper.ensureInitialized();
  @override
  $R call({String? id, String? title, bool? done}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (done != null) #done: done,
    }),
  );
  @override
  ChecklistItem $make(CopyWithData data) => ChecklistItem(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    done: data.get(#done, or: $value.done),
  );

  @override
  ChecklistItemCopyWith<$R2, ChecklistItem, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ChecklistItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class RecurrenceMapper extends ClassMapperBase<Recurrence> {
  RecurrenceMapper._();

  static RecurrenceMapper? _instance;
  static RecurrenceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RecurrenceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Recurrence';

  static String _$rule(Recurrence v) => v.rule;
  static const Field<Recurrence, String> _f$rule = Field('rule', _$rule);

  @override
  final MappableFields<Recurrence> fields = const {#rule: _f$rule};

  static Recurrence _instantiate(DecodingData data) {
    return Recurrence(rule: data.dec(_f$rule));
  }

  @override
  final Function instantiate = _instantiate;

  static Recurrence fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Recurrence>(map);
  }

  static Recurrence fromJson(String json) {
    return ensureInitialized().decodeJson<Recurrence>(json);
  }
}

mixin RecurrenceMappable {
  String toJson() {
    return RecurrenceMapper.ensureInitialized().encodeJson<Recurrence>(
      this as Recurrence,
    );
  }

  Map<String, dynamic> toMap() {
    return RecurrenceMapper.ensureInitialized().encodeMap<Recurrence>(
      this as Recurrence,
    );
  }

  RecurrenceCopyWith<Recurrence, Recurrence, Recurrence> get copyWith =>
      _RecurrenceCopyWithImpl<Recurrence, Recurrence>(
        this as Recurrence,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return RecurrenceMapper.ensureInitialized().stringifyValue(
      this as Recurrence,
    );
  }

  @override
  bool operator ==(Object other) {
    return RecurrenceMapper.ensureInitialized().equalsValue(
      this as Recurrence,
      other,
    );
  }

  @override
  int get hashCode {
    return RecurrenceMapper.ensureInitialized().hashValue(this as Recurrence);
  }
}

extension RecurrenceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Recurrence, $Out> {
  RecurrenceCopyWith<$R, Recurrence, $Out> get $asRecurrence =>
      $base.as((v, t, t2) => _RecurrenceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class RecurrenceCopyWith<$R, $In extends Recurrence, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? rule});
  RecurrenceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RecurrenceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Recurrence, $Out>
    implements RecurrenceCopyWith<$R, Recurrence, $Out> {
  _RecurrenceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Recurrence> $mapper =
      RecurrenceMapper.ensureInitialized();
  @override
  $R call({String? rule}) =>
      $apply(FieldCopyWithData({if (rule != null) #rule: rule}));
  @override
  Recurrence $make(CopyWithData data) =>
      Recurrence(rule: data.get(#rule, or: $value.rule));

  @override
  RecurrenceCopyWith<$R2, Recurrence, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _RecurrenceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TodoMapper extends ClassMapperBase<Todo> {
  TodoMapper._();

  static TodoMapper? _instance;
  static TodoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TodoMapper._());
      StatusMapper.ensureInitialized();
      PriorityMapper.ensureInitialized();
      RecurrenceMapper.ensureInitialized();
      ChecklistItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Todo';

  static String _$id(Todo v) => v.id;
  static const Field<Todo, String> _f$id = Field('id', _$id);
  static String _$title(Todo v) => v.title;
  static const Field<Todo, String> _f$title = Field('title', _$title);
  static String? _$description(Todo v) => v.description;
  static const Field<Todo, String> _f$description = Field(
    'description',
    _$description,
    opt: true,
  );
  static DateTime _$createdAt(Todo v) => v.createdAt;
  static const Field<Todo, DateTime> _f$createdAt = Field(
    'createdAt',
    _$createdAt,
  );
  static DateTime _$updatedAt(Todo v) => v.updatedAt;
  static const Field<Todo, DateTime> _f$updatedAt = Field(
    'updatedAt',
    _$updatedAt,
  );
  static DateTime? _$startAt(Todo v) => v.startAt;
  static const Field<Todo, DateTime> _f$startAt = Field(
    'startAt',
    _$startAt,
    opt: true,
  );
  static DateTime? _$dueAt(Todo v) => v.dueAt;
  static const Field<Todo, DateTime> _f$dueAt = Field(
    'dueAt',
    _$dueAt,
    opt: true,
  );
  static DateTime? _$completedAt(Todo v) => v.completedAt;
  static const Field<Todo, DateTime> _f$completedAt = Field(
    'completedAt',
    _$completedAt,
    opt: true,
  );
  static Status _$status(Todo v) => v.status;
  static const Field<Todo, Status> _f$status = Field(
    'status',
    _$status,
    opt: true,
    def: Status.notStarted,
  );
  static Priority _$priority(Todo v) => v.priority;
  static const Field<Todo, Priority> _f$priority = Field(
    'priority',
    _$priority,
    opt: true,
    def: Priority.normal,
  );
  static List<String> _$tags(Todo v) => v.tags;
  static const Field<Todo, List<String>> _f$tags = Field(
    'tags',
    _$tags,
    opt: true,
    def: const [],
  );
  static String? _$projectId(Todo v) => v.projectId;
  static const Field<Todo, String> _f$projectId = Field(
    'projectId',
    _$projectId,
    opt: true,
  );
  static int _$order(Todo v) => v.order;
  static const Field<Todo, int> _f$order = Field(
    'order',
    _$order,
    opt: true,
    def: 0,
  );
  static bool _$archived(Todo v) => v.archived;
  static const Field<Todo, bool> _f$archived = Field(
    'archived',
    _$archived,
    opt: true,
    def: false,
  );
  static bool _$deleted(Todo v) => v.deleted;
  static const Field<Todo, bool> _f$deleted = Field(
    'deleted',
    _$deleted,
    opt: true,
    def: false,
  );
  static List<DateTime> _$reminders(Todo v) => v.reminders;
  static const Field<Todo, List<DateTime>> _f$reminders = Field(
    'reminders',
    _$reminders,
    opt: true,
    def: const [],
  );
  static Recurrence? _$recurrence(Todo v) => v.recurrence;
  static const Field<Todo, Recurrence> _f$recurrence = Field(
    'recurrence',
    _$recurrence,
    opt: true,
  );
  static List<ChecklistItem> _$subtasks(Todo v) => v.subtasks;
  static const Field<Todo, List<ChecklistItem>> _f$subtasks = Field(
    'subtasks',
    _$subtasks,
    opt: true,
    def: const [],
  );

  @override
  final MappableFields<Todo> fields = const {
    #id: _f$id,
    #title: _f$title,
    #description: _f$description,
    #createdAt: _f$createdAt,
    #updatedAt: _f$updatedAt,
    #startAt: _f$startAt,
    #dueAt: _f$dueAt,
    #completedAt: _f$completedAt,
    #status: _f$status,
    #priority: _f$priority,
    #tags: _f$tags,
    #projectId: _f$projectId,
    #order: _f$order,
    #archived: _f$archived,
    #deleted: _f$deleted,
    #reminders: _f$reminders,
    #recurrence: _f$recurrence,
    #subtasks: _f$subtasks,
  };

  static Todo _instantiate(DecodingData data) {
    return Todo(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      createdAt: data.dec(_f$createdAt),
      updatedAt: data.dec(_f$updatedAt),
      startAt: data.dec(_f$startAt),
      dueAt: data.dec(_f$dueAt),
      completedAt: data.dec(_f$completedAt),
      status: data.dec(_f$status),
      priority: data.dec(_f$priority),
      tags: data.dec(_f$tags),
      projectId: data.dec(_f$projectId),
      order: data.dec(_f$order),
      archived: data.dec(_f$archived),
      deleted: data.dec(_f$deleted),
      reminders: data.dec(_f$reminders),
      recurrence: data.dec(_f$recurrence),
      subtasks: data.dec(_f$subtasks),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Todo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Todo>(map);
  }

  static Todo fromJson(String json) {
    return ensureInitialized().decodeJson<Todo>(json);
  }
}

mixin TodoMappable {
  String toJson() {
    return TodoMapper.ensureInitialized().encodeJson<Todo>(this as Todo);
  }

  Map<String, dynamic> toMap() {
    return TodoMapper.ensureInitialized().encodeMap<Todo>(this as Todo);
  }

  TodoCopyWith<Todo, Todo, Todo> get copyWith =>
      _TodoCopyWithImpl<Todo, Todo>(this as Todo, $identity, $identity);
  @override
  String toString() {
    return TodoMapper.ensureInitialized().stringifyValue(this as Todo);
  }

  @override
  bool operator ==(Object other) {
    return TodoMapper.ensureInitialized().equalsValue(this as Todo, other);
  }

  @override
  int get hashCode {
    return TodoMapper.ensureInitialized().hashValue(this as Todo);
  }
}

extension TodoValueCopy<$R, $Out> on ObjectCopyWith<$R, Todo, $Out> {
  TodoCopyWith<$R, Todo, $Out> get $asTodo =>
      $base.as((v, t, t2) => _TodoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TodoCopyWith<$R, $In extends Todo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  ListCopyWith<$R, DateTime, ObjectCopyWith<$R, DateTime, DateTime>>
  get reminders;
  RecurrenceCopyWith<$R, Recurrence, Recurrence>? get recurrence;
  ListCopyWith<
    $R,
    ChecklistItem,
    ChecklistItemCopyWith<$R, ChecklistItem, ChecklistItem>
  >
  get subtasks;
  $R call({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? startAt,
    DateTime? dueAt,
    DateTime? completedAt,
    Status? status,
    Priority? priority,
    List<String>? tags,
    String? projectId,
    int? order,
    bool? archived,
    bool? deleted,
    List<DateTime>? reminders,
    Recurrence? recurrence,
    List<ChecklistItem>? subtasks,
  });
  TodoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TodoCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Todo, $Out>
    implements TodoCopyWith<$R, Todo, $Out> {
  _TodoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Todo> $mapper = TodoMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  ListCopyWith<$R, DateTime, ObjectCopyWith<$R, DateTime, DateTime>>
  get reminders => ListCopyWith(
    $value.reminders,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(reminders: v),
  );
  @override
  RecurrenceCopyWith<$R, Recurrence, Recurrence>? get recurrence =>
      $value.recurrence?.copyWith.$chain((v) => call(recurrence: v));
  @override
  ListCopyWith<
    $R,
    ChecklistItem,
    ChecklistItemCopyWith<$R, ChecklistItem, ChecklistItem>
  >
  get subtasks => ListCopyWith(
    $value.subtasks,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(subtasks: v),
  );
  @override
  $R call({
    String? id,
    String? title,
    Object? description = $none,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? startAt = $none,
    Object? dueAt = $none,
    Object? completedAt = $none,
    Status? status,
    Priority? priority,
    List<String>? tags,
    Object? projectId = $none,
    int? order,
    bool? archived,
    bool? deleted,
    List<DateTime>? reminders,
    Object? recurrence = $none,
    List<ChecklistItem>? subtasks,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (description != $none) #description: description,
      if (createdAt != null) #createdAt: createdAt,
      if (updatedAt != null) #updatedAt: updatedAt,
      if (startAt != $none) #startAt: startAt,
      if (dueAt != $none) #dueAt: dueAt,
      if (completedAt != $none) #completedAt: completedAt,
      if (status != null) #status: status,
      if (priority != null) #priority: priority,
      if (tags != null) #tags: tags,
      if (projectId != $none) #projectId: projectId,
      if (order != null) #order: order,
      if (archived != null) #archived: archived,
      if (deleted != null) #deleted: deleted,
      if (reminders != null) #reminders: reminders,
      if (recurrence != $none) #recurrence: recurrence,
      if (subtasks != null) #subtasks: subtasks,
    }),
  );
  @override
  Todo $make(CopyWithData data) => Todo(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    createdAt: data.get(#createdAt, or: $value.createdAt),
    updatedAt: data.get(#updatedAt, or: $value.updatedAt),
    startAt: data.get(#startAt, or: $value.startAt),
    dueAt: data.get(#dueAt, or: $value.dueAt),
    completedAt: data.get(#completedAt, or: $value.completedAt),
    status: data.get(#status, or: $value.status),
    priority: data.get(#priority, or: $value.priority),
    tags: data.get(#tags, or: $value.tags),
    projectId: data.get(#projectId, or: $value.projectId),
    order: data.get(#order, or: $value.order),
    archived: data.get(#archived, or: $value.archived),
    deleted: data.get(#deleted, or: $value.deleted),
    reminders: data.get(#reminders, or: $value.reminders),
    recurrence: data.get(#recurrence, or: $value.recurrence),
    subtasks: data.get(#subtasks, or: $value.subtasks),
  );

  @override
  TodoCopyWith<$R2, Todo, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TodoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}


import 'package:diu_student/features/routine/domain/entities/slot.dart';

class SlotModel extends SlotEntity {
  const SlotModel({
    String? id,
    String? room,
    String? time,
    String? batch,
    String? section,
    String? course,
    String? ti,
    String? day
    }) : super(
    id: id,
    room: room,
    time: time,
    batch: batch,
    section: section,
    course: course,
    ti: ti,
    day: day
  );

  factory SlotModel.fromJson(Map<String, dynamic> map){
    return SlotModel(
      id: map["id"] ?? "",
      room: map["room"] ?? "",
      time: map["time"] ?? "",
      batch: map["batch"] ?? "",
      section: map["section"] ?? "",
      course: map["course"] ?? "",
      ti: map["ti"] ?? "",
      day: map["day"] ?? "",
    );
  }
}
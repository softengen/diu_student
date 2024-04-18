import 'package:dio/dio.dart';
import 'package:diu_student/features/routine/data/models/slot.dart';
import 'package:diu_student/features/routine/data/models/time.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants&variables/constants.dart';
part 'routine_api.g.dart';


@RestApi(baseUrl : routine_api)
abstract class RoutineApi{
  factory RoutineApi(Dio dio) = _RoutineApi;

  @GET("/student-routine/")
  Future<HttpResponse<List<SlotModel>>> getStudentRoutineJson(
      @Query("batchSection") String batchSection
      );

  @GET("/teacher-routine/")
  Future<HttpResponse<List<SlotModel>>> getTeacherRoutineJson(
      @Query("teacherInitial") String teacherInitial
      );

  @GET("/times")
  Future<HttpResponse<List<TimeModel>>> getTimes();
}



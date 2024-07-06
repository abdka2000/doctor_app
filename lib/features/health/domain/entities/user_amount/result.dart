import 'paged_result_dto.dart';

class Result {
  PagedResultDto? pagedResultDto;
  int? deptTotalAmount;
  int? pushTotalAmount;

  Result({this.pagedResultDto, this.deptTotalAmount, this.pushTotalAmount});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        pagedResultDto: json['pagedResultDto'] == null
            ? null
            : PagedResultDto.fromJson(
                json['pagedResultDto'] as Map<String, dynamic>),
        deptTotalAmount: json['deptTotalAmount'] as int?,
        pushTotalAmount: json['pushTotalAmount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pagedResultDto': pagedResultDto?.toJson(),
        'deptTotalAmount': deptTotalAmount,
        'pushTotalAmount': pushTotalAmount,
      };
}

import 'paged_result_dto.dart';

class UserAmountEntity {
  PagedResultDto? pagedResultDto;
  int? deptTotalAmount;
  int? pushTotalAmount;

  UserAmountEntity({
    this.pagedResultDto,
    this.deptTotalAmount,
    this.pushTotalAmount,
  });

  factory UserAmountEntity.fromJson(Map<String, dynamic> json) =>
      UserAmountEntity(
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

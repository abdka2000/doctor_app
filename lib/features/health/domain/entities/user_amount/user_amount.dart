import 'paged_result_dto.dart';

class UserAmountEntity {
  PagedResultDto? pagedResultDto;
  double? deptTotalAmount;
  double? pushTotalAmount;

  UserAmountEntity({
    this.pagedResultDto,
    this.deptTotalAmount,
    this.pushTotalAmount,
  });

  factory UserAmountEntity.fromJson(Map<String, dynamic> data) {
    Map<String, dynamic> json = data['result'];

    return UserAmountEntity(
      pagedResultDto: json['pagedResultDto'] == null
          ? null
          : PagedResultDto.fromJson(
              json['pagedResultDto'] as Map<String, dynamic>),
      deptTotalAmount: json['deptTotalAmount'] as double?,
      pushTotalAmount: json['pushTotalAmount'] as double?,
    );
  }

  Map<String, dynamic> toJson() => {
        'pagedResultDto': pagedResultDto?.toJson(),
        'deptTotalAmount': deptTotalAmount,
        'pushTotalAmount': pushTotalAmount,
      };
}

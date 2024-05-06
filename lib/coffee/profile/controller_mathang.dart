import 'package:get/get.dart';
class MatHang{
  String tenMH;
  int gia;
  MatHang({
    required this.tenMH,
    required this.gia,
});
}
class ControllerCatalog extends GetxController{
  final _listMH =<MatHang>[
    MatHang(tenMH: "Ổi", gia: 15000),
    MatHang(tenMH: "Me", gia: 15000),
    MatHang(tenMH: "Bưởi", gia: 15000),
    MatHang(tenMH: "Xoài", gia: 15000),
    MatHang(tenMH: "Thanh Long", gia: 15000),
    MatHang(tenMH: "Sầu riêng", gia: 15000),
  ].obs;
  final _gioHang = <int>[].obs;

  List<MatHang> get listMH => _listMH.value;
  List<int> get gioHang => _gioHang.value;
  int get soLuongMH_GioHang => gioHang.length;
  int get tienMuaHang{
    int tong =0;
    for(int index in gioHang)
      tong += listMH[gioHang[index]].gia;
    return tong;
  }
  themVaoGioHang(int index){
    gioHang.add(index);
    _listMH.refresh(); //báo cho UI cập nhật giao diện
    _gioHang.refresh();
  }
    xoaRaKhoiGioHang(int index){
    gioHang.removeAt(index);
    _gioHang.refresh();
    _listMH.refresh();
    }
    bool kiemTraMT_CoTrongGH(index){
      for(int mh in gioHang)
        if(index ==mh)
          return true;
      return false;
    }
  }
import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  final offset = const Offset(-2, -2);
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6047445, size.height * 0.8192955);
    path_0.cubicTo(size.width * 0.6047445, size.height * 0.6609103, size.width * 0.5428211, size.height * 0.5838519,
        size.width * 0.4772702, size.height * 0.5022671);
    path_0.cubicTo(size.width * 0.4138771, size.height * 0.4233716, size.width * 0.3483419, size.height * 0.3418259,
        size.width * 0.3483419, size.height * 0.1811501);
    path_0.cubicTo(size.width * 0.3483419, size.height * 0.1235811, size.width * 0.3564800, size.height * 0.07368898,
        size.width * 0.3734130, size.height * 0.02704900);
    path_0.cubicTo(size.width * 0.2197809, size.height * 0.09448388, size.width * 0.1090208, size.height * 0.2809422,
        size.width * 0.1090208, size.height * 0.5000000);
    path_0.cubicTo(size.width * 0.1090208, size.height * 0.7757122, size.width * 0.2844171, size.height,
        size.width * 0.4999961, size.height);
    path_0.cubicTo(size.width * 0.5264431, size.height, size.width * 0.5522648, size.height * 0.9965837,
        size.width * 0.5772421, size.height * 0.9901654);
    path_0.cubicTo(size.width * 0.5762649, size.height * 0.9858266, size.width * 0.5764838, size.height * 0.9811595,
        size.width * 0.5781880, size.height * 0.9766878);
    path_0.cubicTo(size.width * 0.5960591, size.height * 0.9296257, size.width * 0.6047445, size.height * 0.8781466,
        size.width * 0.6047445, size.height * 0.8192955);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.brown;
    canvas.drawPath(path_0.shift(offset), paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4999961, 0);
    path_1.cubicTo(size.width * 0.4768715, 0, size.width * 0.4542473, size.height * 0.002736171, size.width * 0.4322172,
        size.height * 0.007676913);
    path_1.cubicTo(size.width * 0.4319749, size.height * 0.008317959, size.width * 0.4318107, size.height * 0.008974640,
        size.width * 0.4315058, size.height * 0.009607868);
    path_1.cubicTo(size.width * 0.4067708, size.height * 0.06057882, size.width * 0.3952477, size.height * 0.1150833,
        size.width * 0.3952477, size.height * 0.1811423);
    path_1.cubicTo(size.width * 0.3952477, size.height * 0.3253072, size.width * 0.4501900, size.height * 0.3936880,
        size.width * 0.5138098, size.height * 0.4728494);
    path_1.cubicTo(size.width * 0.5784304, size.height * 0.5532693, size.width * 0.6516503, size.height * 0.6443916,
        size.width * 0.6516503, size.height * 0.8192798);
    path_1.cubicTo(size.width * 0.6516503, size.height * 0.8751212, size.width * 0.6443721, size.height * 0.9252009,
        size.width * 0.6295577, size.height * 0.9716533);
    path_1.cubicTo(size.width * 0.7816419, size.height * 0.9031239, size.width * 0.8909792, size.height * 0.7176272,
        size.width * 0.8909792, size.height * 0.4999844);
    path_1.cubicTo(
        size.width * 0.8909871, size.height * 0.2242956, size.width * 0.7155907, 0, size.width * 0.4999961, 0);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.brown;
    canvas.drawPath(path_1.shift(offset), paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4228781, size.height * 0.5265478);
    path_0.cubicTo(size.width * 0.4286886, size.height * 0.5817508, size.width * 0.4593194, size.height * 0.6184207,
        size.width * 0.4593194, size.height * 0.6184207);
    path_0.cubicTo(size.width * 0.4593194, size.height * 0.6184207, size.width * 0.3459681, size.height * 0.6014656,
        size.width * 0.3095053, size.height * 0.5268388);
    path_0.cubicTo(size.width * 0.2337378, size.height * 0.5327744, size.width * 0.1643395, size.height * 0.5496259,
        size.width * 0.1111092, size.height * 0.5713739);
    path_0.lineTo(size.width * 0.07790414, size.height * 0.5845321);
    path_0.cubicTo(size.width * 0.05928895, size.height * 0.5929578, size.width * 0.03731243, size.height * 0.5861707,
        size.width * 0.02666596, size.height * 0.5687176);
    path_0.cubicTo(size.width * 0.02266011, size.height * 0.5621395, size.width * 0.02075191, size.height * 0.5548759,
        size.width * 0.02075191, size.height * 0.5477157);
    path_0.cubicTo(size.width * 0.02075191, size.height * 0.5335829, size.width * 0.02816010, size.height * 0.5198037,
        size.width * 0.04144328, size.height * 0.5123740);
    path_0.lineTo(size.width * 0.07375572, size.height * 0.4918291);
    path_0.cubicTo(size.width * 0.07375572, size.height * 0.4918291, size.width * 0.07288462, size.height * 0.2715190,
        size.width * 0.3511575, size.height * 0.2713725);
    path_0.cubicTo(size.width * 0.3702708, size.height * 0.2713510, size.width * 0.3887414, size.height * 0.2722436,
        size.width * 0.4065871, size.height * 0.2739663);
    path_0.cubicTo(size.width * 0.4653389, size.height * 0.2795893, size.width * 0.5174267, size.height * 0.2940971,
        size.width * 0.5633329, size.height * 0.3146830);
    path_0.cubicTo(size.width * 0.7480532, size.height * 0.3975070, size.width * 0.8329320, size.height * 0.5786981,
        size.width * 0.8491175, size.height * 0.6758639);
    path_0.cubicTo(size.width * 0.9002932, size.height * 0.6938561, size.width * 0.9625313, size.height * 0.7056646,
        size.width * 0.9792364, size.height * 0.8027250);
    path_0.cubicTo(size.width * 0.9792364, size.height * 0.8027250, size.width * 0.9517813, size.height * 0.7684614,
        size.width * 0.8964748, size.height * 0.7701020);
    path_0.cubicTo(size.width * 0.8479554, size.height * 0.7715551, size.width * 0.8411058, size.height * 0.7515278,
        size.width * 0.8411058, size.height * 0.7515278);
    path_0.cubicTo(size.width * 0.8411058, size.height * 0.7515278, size.width * 0.8372464, size.height * 0.7726743,
        size.width * 0.8130902, size.height * 0.7829887);
    path_0.cubicTo(size.width * 0.7779360, size.height * 0.7980141, size.width * 0.7653598, size.height * 0.8155922,
        size.width * 0.7653598, size.height * 0.8155922);
    path_0.cubicTo(size.width * 0.7653598, size.height * 0.8155922, size.width * 0.7241861, size.height * 0.7457173,
        size.width * 0.7862582, size.height * 0.6958912);
    path_0.cubicTo(size.width * 0.6899654, size.height * 0.5839500, size.width * 0.5542001, size.height * 0.5364677,
        size.width * 0.4228781, size.height * 0.5265478);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffE1EBF7).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4065871, size.height * 0.2739663);
    path_1.cubicTo(size.width * 0.4540694, size.height * 0.1810973, size.width * 0.5877781, size.height * 0.1748922,
        size.width * 0.6396198, size.height * 0.1914742);
    path_1.cubicTo(size.width * 0.6396198, size.height * 0.1914742, size.width * 0.5501552, size.height * 0.2311949,
        size.width * 0.5637489, size.height * 0.3137709);
    path_1.lineTo(size.width * 0.5633329, size.height * 0.3146849);
    path_1.cubicTo(size.width * 0.5174267, size.height * 0.2940971, size.width * 0.4653370, size.height * 0.2795913,
        size.width * 0.4065871, size.height * 0.2739663);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffD2E3F7).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.2976381, size.height * 0.2951322);
    path_2.cubicTo(size.width * 0.2984486, size.height * 0.2951322, size.width * 0.2992689, size.height * 0.2950854,
        size.width * 0.3000932, size.height * 0.2949877);
    path_2.lineTo(size.width * 0.3023822, size.height * 0.2947260);
    path_2.cubicTo(size.width * 0.3137728, size.height * 0.2934506, size.width * 0.3219701, size.height * 0.2831811,
        size.width * 0.3206947, size.height * 0.2717905);
    path_2.cubicTo(size.width * 0.3194154, size.height * 0.2604018, size.width * 0.3091478, size.height * 0.2522104,
        size.width * 0.2977592, size.height * 0.2534780);
    path_2.lineTo(size.width * 0.2952358, size.height * 0.2537690);
    path_2.cubicTo(size.width * 0.2838530, size.height * 0.2551089, size.width * 0.2757143, size.height * 0.2654253,
        size.width * 0.2770541, size.height * 0.2768081);
    path_2.cubicTo(size.width * 0.2782983, size.height * 0.2873647, size.width * 0.2872612, size.height * 0.2951322,
        size.width * 0.2976381, size.height * 0.2951322);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.blueAccent;
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.1630856, size.height * 0.4153371);
    path_3.cubicTo(size.width * 0.1517849, size.height * 0.4172570, size.width * 0.1441833, size.height * 0.4279738,
        size.width * 0.1461013, size.height * 0.4392726);
    path_3.lineTo(size.width * 0.1468064, size.height * 0.4434230);
    path_3.cubicTo(size.width * 0.1485271, size.height * 0.4535460, size.width * 0.1573063, size.height * 0.4607022,
        size.width * 0.1672419, size.height * 0.4607022);
    path_3.cubicTo(size.width * 0.1683962, size.height * 0.4607022, size.width * 0.1695661, size.height * 0.4606065,
        size.width * 0.1707438, size.height * 0.4604054);
    path_3.cubicTo(size.width * 0.1820446, size.height * 0.4584854, size.width * 0.1896461, size.height * 0.4477687,
        size.width * 0.1877281, size.height * 0.4364699);
    path_3.lineTo(size.width * 0.1870231, size.height * 0.4323195);
    path_3.cubicTo(size.width * 0.1851012, size.height * 0.4210226, size.width * 0.1743942, size.height * 0.4134152,
        size.width * 0.1630856, size.height * 0.4153371);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.blueAccent;
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.7474810, size.height * 0.8261273);
    path_4.cubicTo(size.width * 0.7511118, size.height * 0.8322913, size.width * 0.7574497, size.height * 0.8364554,
        size.width * 0.7646020, size.height * 0.8366429);
    path_4.cubicTo(size.width * 0.7648012, size.height * 0.8366468, size.width * 0.7650005, size.height * 0.8366507,
        size.width * 0.7651997, size.height * 0.8366507);
    path_4.cubicTo(size.width * 0.7720532, size.height * 0.8366507, size.width * 0.7782817, size.height * 0.8335218,
        size.width * 0.7821313, size.height * 0.8278246);
    path_4.cubicTo(size.width * 0.7833383, size.height * 0.8263578, size.width * 0.7943969, size.height * 0.8135472,
        size.width * 0.8212425, size.height * 0.8020746);
    path_4.cubicTo(size.width * 0.8330941, size.height * 0.7970121, size.width * 0.8415277, size.height * 0.7900746,
        size.width * 0.8475081, size.height * 0.7830785);
    path_4.cubicTo(size.width * 0.8587503, size.height * 0.7880317, size.width * 0.8746506, size.height * 0.7915102,
        size.width * 0.8970920, size.height * 0.7908461);
    path_4.cubicTo(size.width * 0.9397443, size.height * 0.7895746, size.width * 0.9613985, size.height * 0.8137894,
        size.width * 0.9631036, size.height * 0.8157797);
    path_4.cubicTo(size.width * 0.9689200, size.height * 0.8232992, size.width * 0.9789707, size.height * 0.8257308,
        size.width * 0.9876914, size.height * 0.8219183);
    path_4.cubicTo(size.width * 0.9964414, size.height * 0.8180941, size.width * 1.001311, size.height * 0.8086137,
        size.width * 0.9996914, size.height * 0.7992035);
    path_4.cubicTo(size.width * 0.9823750, size.height * 0.6986061, size.width * 0.9198849, size.height * 0.6777155,
        size.width * 0.8696741, size.height * 0.6609303);
    path_4.cubicTo(size.width * 0.8688596, size.height * 0.6606589, size.width * 0.8680589, size.height * 0.6603893,
        size.width * 0.8672483, size.height * 0.6601159);
    path_4.cubicTo(size.width * 0.8475726, size.height * 0.5667626, size.width * 0.7673520, size.height * 0.3892434,
        size.width * 0.5832274, size.height * 0.3010502);
    path_4.cubicTo(size.width * 0.5802801, size.height * 0.2417827, size.width * 0.6451941, size.height * 0.2117261,
        size.width * 0.6480437, size.height * 0.2104390);
    path_4.cubicTo(size.width * 0.6559147, size.height * 0.2069449, size.width * 0.6608112, size.height * 0.1989488,
        size.width * 0.6603444, size.height * 0.1903492);
    path_4.cubicTo(size.width * 0.6598776, size.height * 0.1817477, size.width * 0.6541472, size.height * 0.1743297,
        size.width * 0.6459441, size.height * 0.1717047);
    path_4.cubicTo(size.width * 0.5838153, size.height * 0.1518337, size.width * 0.4513409, size.height * 0.1631559,
        size.width * 0.3951613, size.height * 0.2521733);
    path_4.cubicTo(size.width * 0.3815832, size.height * 0.2511870, size.width * 0.3677551, size.height * 0.2506675,
        size.width * 0.3538919, size.height * 0.2506187);
    path_4.cubicTo(size.width * 0.3538665, size.height * 0.2506187, size.width * 0.3538450, size.height * 0.2506187,
        size.width * 0.3538196, size.height * 0.2506187);
    path_4.cubicTo(size.width * 0.3423939, size.height * 0.2506187, size.width * 0.3331087, size.height * 0.2598647,
        size.width * 0.3330697, size.height * 0.2713003);
    path_4.cubicTo(size.width * 0.3330306, size.height * 0.2827612, size.width * 0.3422903, size.height * 0.2920834,
        size.width * 0.3537513, size.height * 0.2921244);
    path_4.cubicTo(size.width * 0.3700637, size.height * 0.2921811, size.width * 0.3862922, size.height * 0.2929623,
        size.width * 0.4020754, size.height * 0.2944076);
    path_4.cubicTo(size.width * 0.4037316, size.height * 0.2947690, size.width * 0.4054074, size.height * 0.2949291,
        size.width * 0.4070773, size.height * 0.2948803);
    path_4.cubicTo(size.width * 0.4595518, size.height * 0.3001557, size.width * 0.5092568, size.height * 0.3131713,
        size.width * 0.5548446, size.height * 0.3336146);
    path_4.cubicTo(size.width * 0.7395630, size.height * 0.4164386, size.width * 0.8146703, size.height * 0.5957215,
        size.width * 0.8286214, size.height * 0.6791041);
    path_4.cubicTo(size.width * 0.8286253, size.height * 0.6791354, size.width * 0.8286312, size.height * 0.6791666,
        size.width * 0.8286390, size.height * 0.6791979);
    path_4.cubicTo(size.width * 0.8286429, size.height * 0.6792213, size.width * 0.8286468, size.height * 0.6792448,
        size.width * 0.8286507, size.height * 0.6792682);
    path_4.cubicTo(size.width * 0.8287054, size.height * 0.6795944, size.width * 0.8287855, size.height * 0.6799069,
        size.width * 0.8288558, size.height * 0.6802272);
    path_4.cubicTo(size.width * 0.8289203, size.height * 0.6805241, size.width * 0.8289691, size.height * 0.6808268,
        size.width * 0.8290472, size.height * 0.6811217);
    path_4.cubicTo(size.width * 0.8293831, size.height * 0.6824108, size.width * 0.8298421, size.height * 0.6836393,
        size.width * 0.8303988, size.height * 0.6848053);
    path_4.cubicTo(size.width * 0.8304320, size.height * 0.6848737, size.width * 0.8304710, size.height * 0.6849401,
        size.width * 0.8305042, size.height * 0.6850084);
    path_4.cubicTo(size.width * 0.8307542, size.height * 0.6855162, size.width * 0.8310179, size.height * 0.6860143,
        size.width * 0.8313070, size.height * 0.6864967);
    path_4.cubicTo(size.width * 0.8313870, size.height * 0.6866315, size.width * 0.8314769, size.height * 0.6867604,
        size.width * 0.8315609, size.height * 0.6868912);
    path_4.cubicTo(size.width * 0.8318148, size.height * 0.6872916, size.width * 0.8320706, size.height * 0.6876881,
        size.width * 0.8323499, size.height * 0.6880670);
    path_4.cubicTo(size.width * 0.8324827, size.height * 0.6882526, size.width * 0.8326253, size.height * 0.6884283,
        size.width * 0.8327679, size.height * 0.6886061);
    path_4.cubicTo(size.width * 0.8330101, size.height * 0.6889166, size.width * 0.8332581, size.height * 0.6892233,
        size.width * 0.8335160, size.height * 0.6895182);
    path_4.cubicTo(size.width * 0.8337034, size.height * 0.6897311, size.width * 0.8338949, size.height * 0.6899381,
        size.width * 0.8340902, size.height * 0.6901432);
    path_4.cubicTo(size.width * 0.8343226, size.height * 0.6903854, size.width * 0.8345589, size.height * 0.6906256,
        size.width * 0.8348011, size.height * 0.6908580);
    path_4.cubicTo(size.width * 0.8350316, size.height * 0.6910787, size.width * 0.8352640, size.height * 0.6912916,
        size.width * 0.8355042, size.height * 0.6915006);
    path_4.cubicTo(size.width * 0.8357386, size.height * 0.6917037, size.width * 0.8359788, size.height * 0.6918990,
        size.width * 0.8362230, size.height * 0.6920924);
    path_4.cubicTo(size.width * 0.8364808, size.height * 0.6922955, size.width * 0.8367347, size.height * 0.6925006,
        size.width * 0.8370062, size.height * 0.6926940);
    path_4.cubicTo(size.width * 0.8372757, size.height * 0.6928893, size.width * 0.8375589, size.height * 0.6930670,
        size.width * 0.8378363, size.height * 0.6932506);
    path_4.cubicTo(size.width * 0.8380882, size.height * 0.6934147, size.width * 0.8383343, size.height * 0.6935826,
        size.width * 0.8385941, size.height * 0.6937369);
    path_4.cubicTo(size.width * 0.8391273, size.height * 0.6940514, size.width * 0.8396761, size.height * 0.6943443,
        size.width * 0.8402347, size.height * 0.6946119);
    path_4.cubicTo(size.width * 0.8402484, size.height * 0.6946178, size.width * 0.8402620, size.height * 0.6946256,
        size.width * 0.8402757, size.height * 0.6946334);
    path_4.cubicTo(size.width * 0.8408831, size.height * 0.6949205, size.width * 0.8415081, size.height * 0.6951705,
        size.width * 0.8421448, size.height * 0.6953990);
    path_4.cubicTo(size.width * 0.8421780, size.height * 0.6954088, size.width * 0.8422073, size.height * 0.6954264,
        size.width * 0.8422405, size.height * 0.6954381);
    path_4.cubicTo(size.width * 0.8469222, size.height * 0.6970846, size.width * 0.8516956, size.height * 0.6986822,
        size.width * 0.8565179, size.height * 0.7002916);
    path_4.cubicTo(size.width * 0.8909651, size.height * 0.7118072, size.width * 0.9220334, size.height * 0.7221959,
        size.width * 0.9416232, size.height * 0.7555239);
    path_4.cubicTo(size.width * 0.9286896, size.height * 0.7514243, size.width * 0.9134279, size.height * 0.7488286,
        size.width * 0.8958615, size.height * 0.7493521);
    path_4.cubicTo(size.width * 0.8724241, size.height * 0.7500532, size.width * 0.8621897, size.height * 0.7448521,
        size.width * 0.8597737, size.height * 0.7424224);
    path_4.cubicTo(size.width * 0.8560237, size.height * 0.7346040, size.width * 0.8478538, size.height * 0.7294517,
        size.width * 0.8391116, size.height * 0.7303384);
    path_4.cubicTo(size.width * 0.8295921, size.height * 0.7312994, size.width * 0.8220570, size.height * 0.7381138,
        size.width * 0.8207289, size.height * 0.7475591);
    path_4.cubicTo(size.width * 0.8201937, size.height * 0.7495142, size.width * 0.8170824, size.height * 0.7587153,
        size.width * 0.8049418, size.height * 0.7639009);
    path_4.cubicTo(size.width * 0.7924887, size.height * 0.7692212, size.width * 0.7824223, size.height * 0.7749165,
        size.width * 0.7744379, size.height * 0.7802836);
    path_4.cubicTo(size.width * 0.7738325, size.height * 0.7773344, size.width * 0.7733461, size.height * 0.7742114,
        size.width * 0.7730493, size.height * 0.7709633);
    path_4.cubicTo(size.width * 0.7708872, size.height * 0.7472271, size.width * 0.7794575, size.height * 0.7279615,
        size.width * 0.7992543, size.height * 0.7120689);
    path_4.cubicTo(size.width * 0.7993383, size.height * 0.7120025, size.width * 0.7994105, size.height * 0.7119263,
        size.width * 0.7994926, size.height * 0.7118580);
    path_4.cubicTo(size.width * 0.7995922, size.height * 0.7117740, size.width * 0.7996977, size.height * 0.7117037,
        size.width * 0.7997973, size.height * 0.7116197);
    path_4.cubicTo(size.width * 0.7999770, size.height * 0.7114635, size.width * 0.8001332, size.height * 0.7112935,
        size.width * 0.8003070, size.height * 0.7111334);
    path_4.cubicTo(size.width * 0.8005727, size.height * 0.7108892, size.width * 0.8008363, size.height * 0.7106451,
        size.width * 0.8010883, size.height * 0.7103912);
    path_4.cubicTo(size.width * 0.8013266, size.height * 0.7101471, size.width * 0.8015512, size.height * 0.7098951,
        size.width * 0.8017777, size.height * 0.7096412);
    path_4.cubicTo(size.width * 0.8020141, size.height * 0.7093756, size.width * 0.8022504, size.height * 0.7091099,
        size.width * 0.8024711, size.height * 0.7088346);
    path_4.cubicTo(size.width * 0.8026820, size.height * 0.7085709, size.width * 0.8028793, size.height * 0.7082974,
        size.width * 0.8030766, size.height * 0.7080260);
    path_4.cubicTo(size.width * 0.8032797, size.height * 0.7077467, size.width * 0.8034809, size.height * 0.7074654,
        size.width * 0.8036703, size.height * 0.7071744);
    path_4.cubicTo(size.width * 0.8038559, size.height * 0.7068873, size.width * 0.8040258, size.height * 0.7065982,
        size.width * 0.8041957, size.height * 0.7063053);
    path_4.cubicTo(size.width * 0.8043637, size.height * 0.7060142, size.width * 0.8045316, size.height * 0.7057232,
        size.width * 0.8046859, size.height * 0.7054283);
    path_4.cubicTo(size.width * 0.8048441, size.height * 0.7051236, size.width * 0.8049867, size.height * 0.7048131,
        size.width * 0.8051273, size.height * 0.7045025);
    path_4.cubicTo(size.width * 0.8052641, size.height * 0.7042037, size.width * 0.8053988, size.height * 0.7039068,
        size.width * 0.8055199, size.height * 0.7036021);
    path_4.cubicTo(size.width * 0.8056488, size.height * 0.7032818, size.width * 0.8057601, size.height * 0.7029596,
        size.width * 0.8058715, size.height * 0.7026353);
    path_4.cubicTo(size.width * 0.8059769, size.height * 0.7023287, size.width * 0.8060805, size.height * 0.7020240,
        size.width * 0.8061723, size.height * 0.7017115);
    path_4.cubicTo(size.width * 0.8062680, size.height * 0.7013834, size.width * 0.8063480, size.height * 0.7010514,
        size.width * 0.8064281, size.height * 0.7007193);
    path_4.cubicTo(size.width * 0.8065023, size.height * 0.7004029, size.width * 0.8065765, size.height * 0.7000885,
        size.width * 0.8066390, size.height * 0.6997682);
    path_4.cubicTo(size.width * 0.8067015, size.height * 0.6994381, size.width * 0.8067484, size.height * 0.6991061,
        size.width * 0.8067973, size.height * 0.6987740);
    path_4.cubicTo(size.width * 0.8068422, size.height * 0.6984459, size.width * 0.8068890, size.height * 0.6981197,
        size.width * 0.8069183, size.height * 0.6977916);
    path_4.cubicTo(size.width * 0.8069496, size.height * 0.6974635, size.width * 0.8069633, size.height * 0.6971354,
        size.width * 0.8069789, size.height * 0.6968072);
    path_4.cubicTo(size.width * 0.8069926, size.height * 0.6964713, size.width * 0.8070082, size.height * 0.6961354,
        size.width * 0.8070062, size.height * 0.6957975);
    path_4.cubicTo(size.width * 0.8070043, size.height * 0.6954733, size.width * 0.8069906, size.height * 0.6951490,
        size.width * 0.8069730, size.height * 0.6948248);
    path_4.cubicTo(size.width * 0.8069555, size.height * 0.6944850, size.width * 0.8069379, size.height * 0.6941432,
        size.width * 0.8069027, size.height * 0.6938033);
    path_4.cubicTo(size.width * 0.8068695, size.height * 0.6934811, size.width * 0.8068246, size.height * 0.6931608,
        size.width * 0.8067758, size.height * 0.6928404);
    path_4.cubicTo(size.width * 0.8067269, size.height * 0.6925026, size.width * 0.8066742, size.height * 0.6921647,
        size.width * 0.8066078, size.height * 0.6918268);
    path_4.cubicTo(size.width * 0.8065433, size.height * 0.6915045, size.width * 0.8064652, size.height * 0.6911862,
        size.width * 0.8063851, size.height * 0.6908658);
    path_4.cubicTo(size.width * 0.8063012, size.height * 0.6905358, size.width * 0.8062191, size.height * 0.6902057,
        size.width * 0.8061215, size.height * 0.6898776);
    path_4.cubicTo(size.width * 0.8060238, size.height * 0.6895533, size.width * 0.8059125, size.height * 0.6892369,
        size.width * 0.8057973, size.height * 0.6889166);
    path_4.cubicTo(size.width * 0.8056859, size.height * 0.6886022, size.width * 0.8055707, size.height * 0.6882877,
        size.width * 0.8054437, size.height * 0.6879772);
    path_4.cubicTo(size.width * 0.8053109, size.height * 0.6876530, size.width * 0.8051586, size.height * 0.6873346,
        size.width * 0.8050101, size.height * 0.6870162);
    path_4.cubicTo(size.width * 0.8048695, size.height * 0.6867174, size.width * 0.8047269, size.height * 0.6864205,
        size.width * 0.8045726, size.height * 0.6861276);
    path_4.cubicTo(size.width * 0.8044027, size.height * 0.6858073, size.width * 0.8042152, size.height * 0.6854967,
        size.width * 0.8040277, size.height * 0.6851862);
    path_4.cubicTo(size.width * 0.8038578, size.height * 0.6849049, size.width * 0.8036879, size.height * 0.6846217,
        size.width * 0.8035004, size.height * 0.6843444);
    path_4.cubicTo(size.width * 0.8032973, size.height * 0.6840416, size.width * 0.8030746, size.height * 0.6837448,
        size.width * 0.8028519, size.height * 0.6834498);
    path_4.cubicTo(size.width * 0.8027152, size.height * 0.6832662, size.width * 0.8025941, size.height * 0.6830748,
        size.width * 0.8024496, size.height * 0.6828932);
    path_4.cubicTo(size.width * 0.8023773, size.height * 0.6828014, size.width * 0.8022914, size.height * 0.6827233,
        size.width * 0.8022172, size.height * 0.6826334);
    path_4.cubicTo(size.width * 0.8021410, size.height * 0.6825416, size.width * 0.8020766, size.height * 0.6824420,
        size.width * 0.8019965, size.height * 0.6823502);
    path_4.cubicTo(size.width * 0.6955631, size.height * 0.5586200, size.width * 0.5512235, size.height * 0.5184912,
        size.width * 0.4427120, size.height * 0.5074717);
    path_4.cubicTo(size.width * 0.4427882, size.height * 0.4974092, size.width * 0.4438683, size.height * 0.4873623,
        size.width * 0.4459679, size.height * 0.4774463);
    path_4.cubicTo(size.width * 0.4483429, size.height * 0.4662335, size.width * 0.4411769, size.height * 0.4552179,
        size.width * 0.4299660, size.height * 0.4528448);
    path_4.cubicTo(size.width * 0.4187492, size.height * 0.4504698, size.width * 0.4077375, size.height * 0.4576339,
        size.width * 0.4053644, size.height * 0.4688467);
    path_4.cubicTo(size.width * 0.4011867, size.height * 0.4885772, size.width * 0.4001359, size.height * 0.5087217,
        size.width * 0.4022473, size.height * 0.5287158);
    path_4.cubicTo(size.width * 0.4022570, size.height * 0.5288115, size.width * 0.4022727, size.height * 0.5289033,
        size.width * 0.4022824, size.height * 0.5289951);
    path_4.cubicTo(size.width * 0.4022961, size.height * 0.5291181, size.width * 0.4023117, size.height * 0.5292392,
        size.width * 0.4023273, size.height * 0.5293603);
    path_4.cubicTo(size.width * 0.4046769, size.height * 0.5509696, size.width * 0.4104094, size.height * 0.5700067,
        size.width * 0.4168820, size.height * 0.5856121);
    path_4.cubicTo(size.width * 0.3851789, size.height * 0.5741766, size.width * 0.3455814, size.height * 0.5533798,
        size.width * 0.3281595, size.height * 0.5177216);
    path_4.cubicTo(size.width * 0.3221498, size.height * 0.5054131, size.width * 0.3191009, size.height * 0.4917979,
        size.width * 0.3191009, size.height * 0.4772510);
    path_4.cubicTo(size.width * 0.3191009, size.height * 0.4657901, size.width * 0.3098099, size.height * 0.4564991,
        size.width * 0.2983490, size.height * 0.4564991);
    path_4.cubicTo(size.width * 0.2868881, size.height * 0.4564991, size.width * 0.2775971, size.height * 0.4657901,
        size.width * 0.2775971, size.height * 0.4772510);
    path_4.cubicTo(size.width * 0.2775971, size.height * 0.4880772, size.width * 0.2788198, size.height * 0.4985811,
        size.width * 0.2811928, size.height * 0.5087060);
    path_4.cubicTo(size.width * 0.2170797, size.height * 0.5159756, size.width * 0.1547849, size.height * 0.5311181,
        size.width * 0.1033709, size.height * 0.5521102);
    path_4.lineTo(size.width * 0.07026549, size.height * 0.5652274);
    path_4.cubicTo(size.width * 0.06995885, size.height * 0.5653505, size.width * 0.06965611, size.height * 0.5654794,
        size.width * 0.06935533, size.height * 0.5656161);
    path_4.cubicTo(size.width * 0.06030457, size.height * 0.5697157, size.width * 0.04957217, size.height * 0.5663973,
        size.width * 0.04440226, size.height * 0.5579188);
    path_4.cubicTo(size.width * 0.04251164, size.height * 0.5548134, size.width * 0.04151359, size.height * 0.5512841,
        size.width * 0.04151359, size.height * 0.5477079);
    path_4.cubicTo(size.width * 0.04151359, size.height * 0.5405536, size.width * 0.04537101, size.height * 0.5339521,
        size.width * 0.05158193, size.height * 0.5304775);
    path_4.cubicTo(size.width * 0.05192177, size.height * 0.5302880, size.width * 0.05225576, size.height * 0.5300869,
        size.width * 0.05258583, size.height * 0.5298779);
    path_4.lineTo(size.width * 0.08489827, size.height * 0.5093330);
    path_4.cubicTo(size.width * 0.09091193, size.height * 0.5055088, size.width * 0.09454474, size.height * 0.4988682,
        size.width * 0.09451544, size.height * 0.4917393);
    path_4.cubicTo(size.width * 0.09450958, size.height * 0.4902901, size.width * 0.09574786, size.height * 0.3463431,
        size.width * 0.2519683, size.height * 0.3040912);
    path_4.cubicTo(size.width * 0.2630327, size.height * 0.3010990, size.width * 0.2695756, size.height * 0.2897026,
        size.width * 0.2665815, size.height * 0.2786401);
    path_4.cubicTo(size.width * 0.2635893, size.height * 0.2675756, size.width * 0.2521929, size.height * 0.2610327,
        size.width * 0.2411304, size.height * 0.2640268);
    path_4.cubicTo(size.width * 0.1438532, size.height * 0.2903393, size.width * 0.09781231, size.height * 0.3507259,
        size.width * 0.07631821, size.height * 0.3967512);
    path_4.cubicTo(size.width * 0.06003699, size.height * 0.4316085, size.width * 0.05512489, size.height * 0.4634620,
        size.width * 0.05364638, size.height * 0.4800205);
    path_4.lineTo(size.width * 0.03075775, size.height * 0.4945733);
    path_4.cubicTo(
        size.width * 0.01176560, size.height * 0.5054658, 0, size.height * 0.5257646, 0, size.height * 0.5477157);
    path_4.cubicTo(0, size.height * 0.5589071, size.width * 0.003091791, size.height * 0.5699012,
        size.width * 0.008951154, size.height * 0.5795262);
    path_4.cubicTo(size.width * 0.02037887, size.height * 0.5982625, size.width * 0.04051945, size.height * 0.6088738,
        size.width * 0.06131238, size.height * 0.6088738);
    path_4.cubicTo(size.width * 0.06959752, size.height * 0.6088738, size.width * 0.07798422, size.height * 0.6071863,
        size.width * 0.08596272, size.height * 0.6036609);
    path_4.lineTo(size.width * 0.1187537, size.height * 0.5906668);
    path_4.cubicTo(size.width * 0.1188220, size.height * 0.5906395, size.width * 0.1188884, size.height * 0.5906121,
        size.width * 0.1189568, size.height * 0.5905828);
    path_4.cubicTo(size.width * 0.1701754, size.height * 0.5696551, size.width * 0.2332984, size.height * 0.5549149,
        size.width * 0.2979916, size.height * 0.5486747);
    path_4.cubicTo(size.width * 0.3440071, size.height * 0.6213425, size.width * 0.4514483, size.height * 0.6382253,
        size.width * 0.4562452, size.height * 0.6389421);
    path_4.cubicTo(size.width * 0.4572686, size.height * 0.6390964, size.width * 0.4582901, size.height * 0.6391706,
        size.width * 0.4593038, size.height * 0.6391687);
    path_4.cubicTo(size.width * 0.4666964, size.height * 0.6391687, size.width * 0.4736182, size.height * 0.6351882,
        size.width * 0.4773428, size.height * 0.6286179);
    path_4.cubicTo(size.width * 0.4815791, size.height * 0.6211472, size.width * 0.4807491, size.height * 0.6118074,
        size.width * 0.4752940, size.height * 0.6051766);
    path_4.cubicTo(size.width * 0.4750772, size.height * 0.6049129, size.width * 0.4576632, size.height * 0.5833973,
        size.width * 0.4483780, size.height * 0.5498466);
    path_4.cubicTo(size.width * 0.5433271, size.height * 0.5609442, size.width * 0.6644362, size.height * 0.5962156,
        size.width * 0.7573891, size.height * 0.6948580);
    path_4.cubicTo(size.width * 0.7165494, size.height * 0.7414361, size.width * 0.7318384, size.height * 0.7995785,
        size.width * 0.7474810, size.height * 0.8261273);
    path_4.close();
    path_4.moveTo(size.width * 0.5263466, size.height * 0.2118472);
    path_4.cubicTo(size.width * 0.5462157, size.height * 0.2070426, size.width * 0.5661024, size.height * 0.2050797,
        size.width * 0.5838758, size.height * 0.2050582);
    path_4.cubicTo(size.width * 0.5638153, size.height * 0.2244585, size.width * 0.5462978, size.height * 0.2509487,
        size.width * 0.5424247, size.height * 0.2837006);
    path_4.cubicTo(size.width * 0.5106865, size.height * 0.2718725, size.width * 0.4773858, size.height * 0.2631792,
        size.width * 0.4428780, size.height * 0.2576850);
    path_4.cubicTo(size.width * 0.4669444, size.height * 0.2311890, size.width * 0.5000654, size.height * 0.2182047,
        size.width * 0.5263466, size.height * 0.2118472);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Colors.blueAccent;
    canvas.drawPath(path_4, paint_4_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

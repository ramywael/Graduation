
//........................................
// Expanded(
// child: Container(
// decoration: BoxDecoration(
// color: Colors.grey[300],
// borderRadius: const BorderRadius.only(
// topLeft: Radius.circular(30),
// topRight: Radius.circular(30),
// ),
// ),
// child: Column(
// children: [
// Container(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(
// 10,
// ),
// border: Border.all(
// color: kPrimaryColor,
// width: 1,
// ),
// ),
// margin: const EdgeInsets.only(
// top: 40,
// ),
// child: const Padding(
// padding:
// EdgeInsets.symmetric(vertical: 5, horizontal: 10),
// child: CustomTextWidget(
// text: "Be Today's Hero",
// fontSize: 26,
// fontFamily: "Pacifico",
// ),
// ),
// ),
//
//
// const Padding(
// padding: EdgeInsets.symmetric(vertical: 40,horizontal: 15),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.start,
// children: [
// CustomCategoryWidget(text: 'Donate Now',icon: MaterialSymbolsIcons.Symbols.heart_plus,),
// CustomCategoryWidget(text: "Request Blood",icon: MaterialSymbolsIcons.Symbols.bloodtype,),
// ],
// ),
// )
// ],
// ),
// ),
// ),

//,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,
// class CustomCategoryWidget extends StatelessWidget {
//   final String text;
//   final IconData icon;
//
//   const CustomCategoryWidget({
//     super.key, required this.text, required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(24),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             offset: const Offset(2, 2),
//             blurRadius: 10,
//             spreadRadius: 3,
//           ),
//         ],
//       ),
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             margin: const EdgeInsets.only(right: 20,),
//             padding: const EdgeInsets.all(5),
//             child:  Icon(
//               icon,
//               fill: 1,
//               size: 30,
//               color: kPrimaryColor,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 20),
//             child: CustomTextWidget(
//               text: text,
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }








//........................
// Expanded(
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: 14),
// child: GridView.builder(
// padding: EdgeInsets.only(
// top: 60
// ),
// physics: const NeverScrollableScrollPhysics(),
// itemCount: categories.length,
// gridDelegate:
// const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 30,
// childAspectRatio: 2.1
// ),
// itemBuilder: (context, index) {
// return CustomCategoryHomeScreen(
// text: categories[index]["Description"],
// icon: categories[index]["Icon"],
// );
// },
// ),
// ),
// ),
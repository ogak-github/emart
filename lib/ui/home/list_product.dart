import 'package:emart_v2/theme/theme_variants.dart';
import 'package:emart_v2/ui/home/gridview_product.dart';
import 'package:emart_v2/ui/home/list_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String imageFile =
    "https://s3-alpha-sig.figma.com/img/79ae/0546/a5b3b3a0d1aee4267015f773bfb0a349?Expires=1702252800&Signature=iaxofnKVp7fVhMtfxnodVbWS48iG7e-BO1OpDY30N~LnAioHxr0PzwvHGFqd2pm0zD8HV7g4RxdEbEKZohwMmBs-zID605fMPFiKiIXY8zndMU~YZNuAyux5794pQZxTegds3yi-FWrBIQCbzqUgenx3LchE-22GZ0ujr4sa-nzRnzsBmLtm0cdQ5t2tp~lgjAOPFhsh21g6XMZrcGIdivO7oFYAoVPId-C6BI3NemBA3NJIg-3-n2Y497ZKrpSVLwt54QBT7TNHBpEzfbekMeixSVjMm98h7GL5o9VOKX9QXMbLi8IUFIrnMXITERZJKneKMeHaiOh5QmtdRcOwHg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4";

class ListProduct extends ConsumerStatefulWidget {
  const ListProduct({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListProductState();
}

class _ListProductState extends ConsumerState<ListProduct> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return CustomScrollView(
      clipBehavior: Clip.hardEdge,
      slivers: [
        SliverAppBar(
          backgroundColor: BACKGROUND_COLOR,
          expandedHeight: 500,
          floating: true,
          pinned: false,
          snap: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(left: 16),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fashion\nSale",
                  style: textStyle.headlineLarge
                      ?.copyWith(color: BACKGROUND_COLOR),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Check Now"),
                ),
              ],
            ),
            background: Image(
              image: AssetImage('assets/sale_image.png'),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            /* Image.asset(
              "sale_image.png",
              width: double.infinity,
              fit: BoxFit.cover,
            ), */
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed([
            SaleInfoProduct(),
            ListCategories(),
            GridViewProduct(),
          ]),
        ),
      ],
    );
  }
}

class SaleInfoProduct extends ConsumerWidget {
  const SaleInfoProduct({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 100,
      child: Card(
        color: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "SUMMER SALE",
                style: textTheme.titleLarge?.copyWith(color: BACKGROUND_COLOR),
              ),
            ),
            Center(
              child: Text(
                "Up to 50% off",
                style: textTheme.bodyMedium?.copyWith(color: BACKGROUND_COLOR),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

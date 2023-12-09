import 'package:emart_v2/provider/product_provider.dart';
import 'package:emart_v2/ui/components/err_message.dart';
import 'package:emart_v2/ui/components/loading_progress.dart';
import 'package:emart_v2/utils/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const String electronic_images =
    "https://images.unsplash.com/photo-1550009158-9ebf69173e03?q=80&w=2701&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

const String jewelery_images =
    "https://images.unsplash.com/photo-1573408301185-9146fe634ad0?q=80&w=2675&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
const String man_clothing =
    "https://images.unsplash.com/photo-1505022610485-0249ba5b3675?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
const String women_clothing =
    "https://images.unsplash.com/photo-1627903893282-77403ec2637d?q=80&w=2653&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

class ListCategories extends ConsumerWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(getCategoriesProvider);

    Widget imageCategory(String category, {double? width}) {
      if (category.toLowerCase() == "electronics") {
        return Expanded(
          child: Image.network(
            electronic_images,
            width: width,
            fit: BoxFit.cover,
          ),
        );
      }
      if (category.toLowerCase() == "jewelery") {
        return Expanded(
          child: Image.network(
            jewelery_images,
            width: width,
            fit: BoxFit.cover,
          ),
        );
      }
      if (category.toLowerCase() == "men's clothing") {
        return Expanded(
          child: Image.network(
            man_clothing,
            width: width,
            fit: BoxFit.cover,
          ),
        );
      }
      if (category.toLowerCase() == "women's clothing") {
        return Expanded(
          child: Image.network(
            women_clothing,
            width: width,
            fit: BoxFit.cover,
          ),
        );
      }
      return Container();
    }

    return categories.when(
      skipLoadingOnRefresh: true,
      skipLoadingOnReload: true,
      data: (categories) {
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Container(
              height: 100,
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          category.capitalize(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    imageCategory(category,
                        width: MediaQuery.of(context).size.width / 2),
                    /*  Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: imageCategory(category),
                      ),
                    ), */
                  ],
                ),
              ),
            );
          },
        );
      },
      error: (err, _) => ErrMessage(errMessage: err.toString()),
      loading: () => LoadingProgress(),
    );
  }
}

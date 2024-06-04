import 'package:e_commerce/view/home/cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/static/reusable_components.dart';


class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  void initState(){
    CategoriesCubit.get(context).getCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state){
          if (state is CategoriesLoadingState){
            return const CustomLoadingIndicator();
          }else if (state is CategoriesSuccessState){
            return  SizedBox(
              width: 500.w,
              height: 100.h,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                  state.categoriesResponse.categories.length,
                  (index){
                    return Row(
                      children: [
                        SizedBox(width: 20.w,),
                        CategoryContainer(
                          categoryName: state.categoriesResponse.categories[index].name??"",
                          icon: Icons.add_business_sharp,
                        ),
                      ],
                    );
                  })),
            );
          }return const SizedBox();
        }
    );
  }
}



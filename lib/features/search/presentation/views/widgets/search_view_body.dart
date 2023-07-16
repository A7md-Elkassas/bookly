import 'package:bookley_app/core/functions/setup_service_locator.dart';
import 'package:bookley_app/features/search/data/repo/seach_book_repo_impl.dart';
import 'package:bookley_app/features/search/domain/use_cases/search_book_use_case.dart';
import 'package:bookley_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

import '../../manager/search_book_cubit.dart';
import '../../manager/search_book_states.dart';
import 'search_result_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBookCubit>(
      create: (_) => SearchBookCubit(
        SearchBookUseCase(
          getIt.get<SearchBookRepoImpl>(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<SearchBookCubit, SearchBookStates>(
                builder: (context, state) {
              var cubit = BlocProvider.of<SearchBookCubit>(context);
              return SearchTextField(
                searchController: cubit.searchCtrl,
                onChanged: (value) {
                  cubit.searchBook(bookName: value);
                  cubit.searchCtrl.clear();
                },
              );
            }),
            const SizedBox(height: 16),
            const Text("Search Result", style: Styles.textStyle18),
            const SizedBox(height: 16),
            BlocConsumer<SearchBookCubit, SearchBookStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is SearchBookSuccessState) {
                    return Expanded(
                        child: SearchResultList(
                      bookEntity: state.books,
                    ));
                  } else if (state is SearchBookErrorState) {
                    return Text(state.errorMsg);
                  } else if (state is SearchBookLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return const Center(
                      child: Text("no Books"),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

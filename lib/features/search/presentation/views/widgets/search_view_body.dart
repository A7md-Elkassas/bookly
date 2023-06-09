import 'package:bookley_app/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

import 'search_result_list.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SearchTextField(),
          SizedBox(height: 16),
          Text("Search Result", style: Styles.textStyle18),
          SizedBox(height: 16),
          Expanded(child: SearchResultList()),
        ],
      ),
    );
  }
}

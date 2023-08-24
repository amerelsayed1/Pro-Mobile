part of '../pages/experts_page.dart';

class _CategoryBuilder extends StatelessWidget {
  const _CategoryBuilder({
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ).copyWith(left: 16),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              //ref.read(selectedCategoryProvider.notifier).state = categories[index];
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  categories[index].nameEn ?? "",
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }


}

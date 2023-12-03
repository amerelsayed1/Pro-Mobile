part of '../pages/home/experts_page.dart';

class _CategoryBuilder extends StatefulWidget {
  const _CategoryBuilder({
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<_CategoryBuilder> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.categories.insert(
        0,
        CategoryModel(
          nameEn: "All",
          nameAr: "الكل",
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ).copyWith(left: 16),
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {

              setState(
                () {
                  selectedIndex = index;
                },
              );

            /*  Provider.of<TestPattern>(context, listen: false).getExperts(
                widget.categories[selectedIndex].id,
              );*/

            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(
                  8,
                ),
              ),
              child: Center(
                child: Text(
                  widget.categories[index].nameEn ?? "",
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.blue : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
}

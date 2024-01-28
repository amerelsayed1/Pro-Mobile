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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16,
      ).copyWith(left: 16),
      height: 95,
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
              Get.find<HomeController>()
                  .fetchExperts(widget.categories[selectedIndex].id);
            },
            child: Column(
              children: [
                ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: Images.ic_place_holder,
                    image:  "https://source.unsplash.com/random/200x200?sig=${widget.categories[index].id}",
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        Images.ic_place_holder,
                        fit: BoxFit.fitWidth,
                      );
                    },
                    height: 60.0,
                    width: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsetsDirectional.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      widget.categories[index].nameEn ?? "",
                      style: TextStyle(
                        color: selectedIndex == index ? Colors.black : Colors.black,
                        fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: selectedIndex == index ? Colors.black : Colors.transparent,
                  height: 1,
                  width: 40,
                ),
                /*Container(
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
                  margin: EdgeInsetsDirectional.only(top: 8),
                  child: Center(
                    child: Text(
                      widget.categories[index].nameEn ?? "",
                      style: TextStyle(
                        color: selectedIndex == index ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                ),*/
              ],
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

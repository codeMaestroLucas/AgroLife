import 'package:agro_life/constraints.dart';
import 'package:agro_life/screens/home/widgets/agrolife_title_widget.dart';
import 'package:agro_life/util/responsive.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          Row(
            children: [
              if (!Responsive.isMobile(context))
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => Scaffold.of(context).openDrawer(),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(Icons.menu, color: Colors.grey, size: 25),
                    ),
                  ),
                ),

              AgroLifeTitle(),
              const SizedBox(width: 12),
            ],
          ),

        Responsive.isMobile(context)
            ? Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.grey, size: 25),
                ),

                InkWell(
                  onTap: Scaffold.of(context).openEndDrawer,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/avatar.png', width: 32),
                  ),
                ),
              ],
            )
            : Expanded(
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colorCardBg,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(35, 136, 178, 172),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 21),
                ),
              ),
            ),
      ],
    );
  }
}

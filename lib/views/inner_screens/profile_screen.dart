import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            expandedHeight: 140,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    opacity: constraints.biggest.height <= 120 ? 1 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: const Text('Account'),
                  ),
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyan,
                          Colors.black26,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(maxWidth*0.05),
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 48,
                            backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/multivendor-d87a2.appspot.com/o/profiles%2FKWwt2fK2pwbsEISSgqELFmu2A4F2?alt=media&token=cf3dfc30-845a-45e9-b1d2-f2a8ac5f71f1'),
                          ), 
                          SizedBox(width: 20,),
                          Text('qtee', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white,),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Container(
                //   height: 80,
                //   width: MediaQuery.of(context).size.width * 0.9,
                //   decoration: const BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(Radius.circular(50)),
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         child: TextButton(
                //           onPressed: () {},
                //           child: const Text(
                //             'Cart',
                //             style: TextStyle(fontSize: 20),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         child: TextButton(
                //           onPressed: () {},
                //           child: const Text(
                //             'Order',
                //             style: TextStyle(fontSize: 20),
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         child: TextButton(
                //           onPressed: () {},
                //           child: const Text(
                //             'WishList',
                //             style: TextStyle(fontSize: 20),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // )
                const SizedBox(
                  height: 20,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                          splashColor: Colors.cyan,
                          onTap: () {},
                          child: SizedBox(
                            height: 80,
                            width: maxWidth * 0.3,
                            child: const Center(
                                child: Text(
                              'Cart',
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        width: 1,
                      ),
                      Material(
                        color: Colors.white,
                        child: InkWell(
                          splashColor: Colors.cyan,
                          onTap: () {},
                          child: SizedBox(
                            height: 80,
                            width: maxWidth * 0.3,
                            child: const Center(
                                child: Text(
                              'Order',
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        width: 1,
                      ),
                      Material(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          splashColor: Colors.cyan,
                          onTap: () {},
                          child: SizedBox(
                            height: 80,
                            width: maxWidth * 0.3,
                            child: const Center(
                                child: Text(
                              'WishList',
                              style: TextStyle(fontSize: 20),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomMainTitle(
                  title: 'Account Info',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.03),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: const [
                        CustomItemInfo(
                          icon: Icon(Icons.person),
                          title: 'Username',
                          subTitle: 'qtee',
                        ),
                        Divider(thickness: 1, height: 1),
                        CustomItemInfo(
                          icon: Icon(Icons.email),
                          title: 'Email',
                          subTitle: 'qtee@gmail.com',
                        ),
                        Divider(thickness: 1, height: 1),
                        CustomItemInfo(
                          icon: Icon(Icons.phone),
                          title: 'Phone',
                          subTitle: '0911 270 031',
                        ),
                        Divider(thickness: 1, height: 1),
                        CustomItemInfo(
                          icon: Icon(Icons.pin_drop),
                          title: 'Address',
                          subTitle: '50 Ta Quang Buu, Hai Ba Trung, Hanoi',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomMainTitle(
                  title: 'Account Setting',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: maxWidth*0.03),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Column(
                      children: const [
                        CustomItemInfo(
                          icon: Icon(Icons.edit),
                          title: 'Edit profile',
                          subTitle: 'Edit your profile',
                        ),
                        Divider(thickness: 1, height: 1),
                        CustomItemInfo(
                          icon: Icon(Icons.lock),
                          title: 'Change the password',
                          subTitle: 'Change to the new password',
                        ),
                        Divider(thickness: 1, height: 1),
                        CustomItemInfo(
                          icon: Icon(Icons.logout),
                          title: 'Sign out',
                          subTitle: 'Sign out this account',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomItemInfo extends StatelessWidget {
  final Icon icon;
  final String title;
  final String subTitle;
  const CustomItemInfo({
    Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class CustomMainTitle extends StatelessWidget {
  final String title;
  const CustomMainTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: const Divider(
            thickness: 1,
            height: 1,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 4,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: const Divider(
            thickness: 1,
            height: 4,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

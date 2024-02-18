import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project_2/bloc/news_bloc.dart';
import 'package:mini_project_2/model/news_model.dart';
import 'package:mini_project_2/services/news_repository.dart';
import 'package:mini_project_2/view/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (BuildContext context) => NewsBloc(NewsRepository()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Mini Project 2')),
        body: blocBody(),
      ),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => NewsBloc(
        NewsRepository(),
      )..add(LoadNewsEvent()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is NewsLoadedState) {
            List<NewsModel> newsList = state.news;
            return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (_, index) {
                NewsModel news = newsList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(news: news),
                        ),
                      );
                      // context.go('/details');
                    },
                    child: Card(
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          news.urlToImage != null
                              ? Image.network(news.urlToImage!,
                                  height: 150, width: double.infinity, fit: BoxFit.cover)
                              : Container(
                                  height: 150,
                                  width: double.infinity,
                                  color: Colors.grey,
                                  child: Icon(Icons.image, color: Colors.white),
                                ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(news.title ?? '',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(news.description ?? ''),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
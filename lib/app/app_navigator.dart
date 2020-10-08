import 'package:flutter/material.dart';
import 'package:flutterph/models/job.model.dart';
import 'package:flutterph/pages/home/home.page.dart';
import 'package:flutterph/pages/job_detail/job_detail.page.dart';
import 'package:flutterph/pages/jobs/jobs.page.dart';
import 'package:flutterph/pages/not_found/not_found.dart';

enum AppPage { home, jobs, job_detail, unknown }

// TODO: Pages can be converted to objects
class AppRoutePath {
  final AppPage page;
  final int jobId;

  AppRoutePath.home()
      : page = AppPage.home,
        jobId = null;

  AppRoutePath.jobs()
      : page = AppPage.jobs,
        jobId = null;

  AppRoutePath.jobDetails(int id)
      : page = AppPage.job_detail,
        jobId = id;

  AppRoutePath.unknown()
      : page = AppPage.unknown,
        jobId = null;

  bool get isHomePage => page == AppPage.home;

  bool get isJobsPage => page == AppPage.job_detail && jobId != null;

  bool get isJobDetailsPage => page == AppPage.job_detail;

  bool get isUnknown => page == AppPage.unknown;
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppRoutePath get currentConfiguration {
    switch (_currentPage) {
      case AppPage.home:
        return AppRoutePath.home();
        break;
      case AppPage.jobs:
        return AppRoutePath.jobs();
        break;
      case AppPage.job_detail:
        return AppRoutePath.jobDetails(_jobs.indexOf(_selectedJob));
        break;
      default:
        return AppRoutePath.unknown();
    }
  }

  AppPage _currentPage = AppPage.home;
  bool show404 = false;
  List<Job> _jobs = [
    Job(1),
    Job(5),
    Job(2),
  ];

  Job _selectedJob;

  List<Page<dynamic>> _getPages() {
    switch (_currentPage) {
      case AppPage.home:
        return [
          MaterialPage(
            key: ValueKey('home'),
            child: HomePage(),
          ),
        ];
        break;
      case AppPage.jobs:
        return [
          MaterialPage(
            key: ValueKey('jobs'),
            child: JobsPage(
              jobs: _jobs,
              onTapped: (Job value) {},
            ),
          ),
        ];
        break;
      case AppPage.job_detail:
        return [
          MaterialPage(
            key: ValueKey('jobs'),
            child: JobsPage(
              jobs: _jobs,
              onTapped: _handleJobTapped,
            ),
          ),
          JobDetailsPageRoute(job: _selectedJob),
        ];
        break;
      default:
        return [
          MaterialPage(
            key: ValueKey('unknown'),
            child: NotFoundPage(),
          ),
        ];
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _getPages(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _selectedJob = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    if (path.isJobDetailsPage) {
      _selectedJob = _jobs[path.jobId];
    }
  }

  void _handleJobTapped(Job job) {
    _selectedJob = job;
    notifyListeners();
  }
}

class JobDetailsPageRoute extends Page {
  final Job job;

  JobDetailsPageRoute({
    this.job,
  }) : super(key: ValueKey(job));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return JobDetailsPage(job: job);
      },
    );
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);

    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return AppRoutePath.home();
    }

    // Handle '/jobs/:id'
    // if (uri.pathSegments.length == 2) {
    //   var path = uri.pathSegments[0];
    //   if (path == "jobs") {
    //     var id = uri.pathSegments[1];
    //     if (id != null) {
    //       return AppRoutePath.jobDetails(int.tryParse(id));
    //     } else {
    //       return AppRoutePath.jobs();
    //     }
    //   } else {}
    // }

    return AppRoutePath.unknown();
  }

  @override
  RouteInformation restoreRouteInformation(AppRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    } else if (path.isHomePage) {
      return RouteInformation(location: '/');
    } else if (path.isJobsPage) {
      return RouteInformation(location: '/jobs');
    } else if (path.isJobDetailsPage) {
      return RouteInformation(location: '/jobs/${path.jobId}');
    }
    return null;
  }
}

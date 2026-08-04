import 'package:flutter_eleonoraguzzy/app/app_manager.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/auth_controller.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface_impl.dart';
import 'package:flutter_eleonoraguzzy/features/information/controller/active_calls_controller.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/information_interface.dart';
import 'package:flutter_eleonoraguzzy/features/information/service/informetion_interface_impl.dart';
import 'package:flutter_eleonoraguzzy/features/notification/controller/notification_controller.dart';
import 'package:flutter_eleonoraguzzy/features/notification/service/notification_interface.dart';
import 'package:flutter_eleonoraguzzy/features/notification/service/notification_interface_impl.dart';
import 'package:flutter_eleonoraguzzy/features/profile/controller/get_profile_controller.dart';
import 'package:flutter_eleonoraguzzy/features/profile/service/profile_repo.dart';
import 'package:flutter_eleonoraguzzy/features/profile/service/profile_repo_impl.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/service/public_matter_interface.dart';
import 'package:flutter_eleonoraguzzy/features/public_matter/service/public_matter_interface_impl.dart';
import 'package:flutter_eleonoraguzzy/features/tender/controller/tender_controller.dart';
import 'package:flutter_eleonoraguzzy/features/tender/service/tender_interface.dart';
import 'package:flutter_eleonoraguzzy/features/tender/service/tender_interface_impl.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/controller/real_time_communications_controller.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/service/contribute_interface.dart';
import 'package:flutter_eleonoraguzzy/features/we_contribute%20/service/contribute_interface_impl.dart';
import 'package:get/get.dart';
import '../../features/we_contribute /controller/electoral_programs_controller.dart';

void initServices() {
  // Initialize other interfaces here
  Get.put<AppManager>(AppManager(), permanent: true);

  Get.put<AuthInterface>(AuthInterfaceImpl(Get.find()));
  Get.put<AuthController>(AuthController(Get.find()), permanent: true);
  Get.put<ProfilInterface>(ProfileInterfaceImpl(appPigeon: Get.find()));
  // Profile data is shared by Home, Profile, and Edit Profile. Keep one
  // instance available so route changes cannot make Get.find fail.
  Get.put<ProfileController>(ProfileController(), permanent: true);

  Get.lazyPut<TenderInterface>(() => TenderInterfaceImpl(Get.find()));
  // These controllers fetch protected content in onInit(). Register them
  // lazily so they are created by the authenticated screens, after the
  // access token has been saved by the login flow.
  Get.lazyPut<TenderController>(
    () => TenderController(Get.find<TenderInterface>()),
    fenix: true,
  );
  Get.put<ContributeInterface>(ContributeInterfaceImpl(Get.find()));

  // Public Matter is used by a tab that remains available across auth-route
  // transitions. Keep its repository registered for the lifetime of the app
  // so Get.offAll cannot remove it before the tab is opened.
  Get.put<PublicMatterInterface>(
    PublicMatterInterfaceImpl(Get.find()),
    permanent: true,
  );
  Get.put<InformationInterface>(InformationInterfaceImpl(Get.find()));
  Get.lazyPut<ActivecallsController>(
    () => ActivecallsController(Get.find<InformationInterface>()),
    fenix: true,
  );
  Get.lazyPut<ElectoralProgressController>(
    () => ElectoralProgressController(Get.find<ContributeInterface>()),
    fenix: true,
  );

  Get.lazyPut<RealTimeCommunicationsController>(
    () => RealTimeCommunicationsController(Get.find<ContributeInterface>()),
    fenix: true,
  );
  Get.lazyPut<NotificationInterface>(
    () => NotificationInterfaceImpl(appPigeon: Get.find()),
  );
  Get.lazyPut(() => NotificationController(), fenix: true);
}

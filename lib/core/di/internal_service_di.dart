import 'package:flutter_eleonoraguzzy/app/app_manager.dart';
import 'package:flutter_eleonoraguzzy/features/auth/controller/auth_controller.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface.dart';
import 'package:flutter_eleonoraguzzy/features/auth/services/auth_interface_impl.dart';
import 'package:flutter_eleonoraguzzy/features/information/controller/active_calls_controller.dart';
import 'package:flutter_eleonoraguzzy/features/information/controller/informetion_local_&_national_controller.dart';
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
  Get.put(TenderController(Get.find<TenderInterface>()));
  Get.put<ContributeInterface>(ContributeInterfaceImpl(Get.find()));

  Get.lazyPut<InformationInterface>(() => InformationInterfaceImpl(Get.find()));

  Get.lazyPut<PublicMatterInterface>(
    () => PublicMatterInterfaceImpl(Get.find()),
  );
  Get.put<InformationInterface>(InformationInterfaceImpl(Get.find()));
  Get.put<NewsController>(NewsController(Get.find()));
  Get.put(ActivecallsController(Get.find()));
  Get.put(ElectoralProgressController(ContributeInterfaceImpl(Get.find())));

  Get.put<RealTimeCommunicationsController>(
    RealTimeCommunicationsController(ContributeInterfaceImpl(Get.find())),
  );
  Get.lazyPut<NotificationInterface>(
    () => NotificationInterfaceImpl(appPigeon: Get.find()),
  );
  Get.lazyPut(() => NotificationController(), fenix: true);
}

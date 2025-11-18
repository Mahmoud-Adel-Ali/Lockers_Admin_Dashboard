class EndPoints {
  static const baseUrl = 'https://teamhup.net/Lockers/public';
  // static const baseUrl =
  //     'https://corsproxy.io/?https://teamhup.net/Lockers/public/api';
  static const signin = '/api/admin/login';
  // static const register = '/api/register';
  static const forgetPassword = '/api/admin/forget-password';
  static const verifyOTP = '/api/admin/verify-otp';
  static const resetPassword = '/api/admin/reset-password';
  static const profile = '/api/admin/profile';

  //* Dashboard Endpoints
  static const homeDashboard = '/api/admin/index';
  static const complaints = '/api/admin/complains';
  static const packages = '/api/admin/default-subscriptions';
  static const companies = '/api/admin/companies';
  static const adminRegions = '/api/admin/regions';
  static const adminLockers = '/api/admin/lockers';
  static const adminUnits = '/api/admin/units';
  static const maintenanceUnits = '/api/admin/under-maintenance-units';
  static const maintenanceLockers = '/api/admin/under-maintenance-lockers';
  static const updateMaintenanceUnits =
      '/api/admin/update-under-maintenance-units';
  static const updateMaintenanceLockers =
      '/api/admin/update-under-maintenance-lockers';
  static const regionsOfMaintenanceUnits =
      '/api/admin/regions-under-maintenance-units';
  static const regionsOfMaintenanceLockers =
      '/api/admin/regions-under-maintenance-lockers';
  static const allEmployees = '/api/admin/employees';
  static const customers = '/api/admin/customers';
  static const ordersRegions = '/api/admin/order-regions';
  static const allReservationUnits = '/api/admin/all-units';
  static const reservationUnitDetails = 'api/admin/orders';
}

// documentation :- https://documenter.getpostman.com/view/31698735/2sB3QDwYk7
// base_url :- https://teamhup.net/Lockers/public

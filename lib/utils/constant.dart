// ignore_for_file: constant_identifier_names

class Constant {
  static String appName = 'Flutter App API Integration';
  //Suffix device Id
  static const String android = '11';
  static const String ios = '12';

  //RESPONSE CODE
  static const String R_SUCCESS = '00';
  static const String R_TIMEOUT = 'SE';
  static const String R_REFUSED = 'Connection refused';
  static const String R_FAILED = 'Connection failed';
  static const String R_SOCKET_EXC = 'SocketException';
  static const String R_EXCEPT = 'Exception:';
  static const String R_RESPONSE = 'DioErrorType.response';
  static const String R_CONNECTING_TIME_OUT = 'DioErrorType.connectTimeout';
  static const String R_SERVICE_UNAVAILABLE = '503';
  static const String R_OTHER_TYPE = 'DioErrorType.other';
  static const String R_CONTINUE_OOB_STEP = 'R1';
  static const String R_DTTOT = 'B1';
  static const String R_IMAGENOTSUPPORT = 'PlatformException';

  static const indoResponseCode = {
    "A": "Nomer telepon kurang dari 10 digit",
    "E": "SE-session kadaluarsa",
    "01": "Sistem Mengalami Gangguan",
    "02": "Transaksi Tidak Dapat Diproses",
    "03": "Komunikasi Gagal",
    "04": "Transaksi Tidak Valid",
    "05": "Transaksi Suspect",
    "06": "Timeout",
    "07": "Terminal ID Tidak Valid",
    "08": "Merchant ID Tidak Valid",
    "09": "Amount Transaksi Tidak Valid Atau Duplikasi",
    "10": "Nasabah Belum Terdaftar Di eBanking",
    "11": "Nasabah Sudah Terdaftar Di eBanking",
    "12": "Registrasi Gagal",
    "13": "Format Message Tidak Sesuai",
    "14": "Kode Kesalahan Tidak Terdefinisi",
    "15": "Koneksi Ke Database Gagal",
    "16": "Nilai Transaksi Kurang Dari Batas Minimum",
    "17": "Intitusi Tidak Valid",
    "18": "Nomor Referensi / Data Transaksi Tidak Ditemukan",
    "19": "Sistem Sedang Offline",
    "20": "Tanggal Settlement Berbeda",
    "21": "Transaksi Sebelumnya Sedang Diproses",
    "24": "Nilai Transaksi Melebihi Batas Maximum",
    "25": "Indikator Transaksi Tidak valid",
    "40": "Nomor Rekening Tidak Dalam 1 CIF",
    "41": "Nomor Rekening Tidak Valid",
    "42": "Status Rekening Tidak Aktif",
    "43": "Status Rekening Diblok",
    "44": "Saldo Tidak Mencukupi",
    "45": "Nomor Rekening Debit & Kredit Tidak Boleh Sama",
    "46": "Nomor Rekening Tujuan Tidak Valid",
    "47": "Kartu Anda Tidak Dapat Digunakan Untuk Bertransaksi",
    "48": "Warm Card: Hak Akses Terbatas",
    "49": "PIN / Password Tidak Valid",
    "50": "Maximum PIN Tries Exceeded",
    "51": "Transaksi Melebihi Batas Limitasi Rekening",
    "52": "Transaksi Melebihi Batas Yang Diperbolehkan",
    "56": "Nomor Tujuan Bank Tidak ada",
    "60": "Nomor Telepon Tidak Valid",
    "61": "Ada Tunggakan Sebelum Tagihan Bulan Ini",
    "62": "Kode Pelanggan Yang Dimasukkan Salah",
    "63": "Tagihan Belum Tersedia",
    "64": "Tagihan Sudah Terbayar",
    "30": "Pelanggan Tidak Ditemukan",
    "70": "Otentikasi Tidak Valid",
    "80": "Data Tidak Ditemukan",
    "71": "Nama Pengguna Tidak Ditemukan",
    "72": "Nama Pengguna Tidak Aktif",
    "73": "Pelanggan Tidak Aktif",
    "74": "Perangkat Tidak Aktif",
    "75": "Kata Sandi Lama Tidak Valid",
    "76": "Kata Sandi Lama dan Baru Tidak Boleh Sama",
    "77": "PIN lama tidak valid",
    "78": "PIN Lama dan Baru Tidak Boleh Sama",
    "79": "Pelanggan Tidak Valid",
    "7A": "OTP tidak valid",
    "7B": "Token Tidak Valid",
    "7E": "Device ID tidak terdaftar",
    "7F": "User di blokir",
    "81": "Data Permintaan Tidak Valid",
    "82": "Nominal Tidak Valid",
    "83": "Biaya Tidak Valid",
    "84": "Tanggal / Waktu Tidak Valid",
    "85": "Kesalahan Database",
    "86": "Nomor Rekening Sudah Terdaftar",
    "8A": "Mutasi Rekening Tidak Ditemukan",
  };

  static const englishResponseCode = {
    "A": "Phone number less than 10 digits",
    "E": "SE-session expire",
    "01": "System Has Interference",
    "02": "Transaction Cannot Be Processed",
    "03": "Communication Failed",
    "04": "Invalid Transaction",
    "05": "Suspect Transaction",
    "06": "Timeout",
    "07": "Invalid Terminal ID",
    "08": "Invalid Merchant ID",
    "09": "Number of Invalid or Duplicated Transactions",
    "10": "Customer Not Registered in eBanking",
    "11": "Customers Already Registered At eBanking",
    "12": "Registration Failed",
    "13": "Message Format Mismatch",
    "14": "Undefined Error Code",
    "15": "Connection to Database Failed",
    "16": "Transaction Value Is Less Than The Minimum Threshold",
    "17": "Invalid Institution",
    "18": "Reference Number / Transaction Data Not Obtained",
    "19": "System is Offline",
    "20": "Different Settlement Date",
    "21": "Previous Transaction Is Being Processed",
    "24": "Transaction Value Is More Than The Maximum Threshold",
    "25": "Invalid Transfer Indicator",
    "40": "Account Number Not Under 1 CIF",
    "41": "Invalid Account Number",
    "42": "Account Status Not Active",
    "43": "Account Status Blocked",
    "44": "Insufficient Balance",
    "45": "The Amount of Debit & Credit Account May Not Be The Same",
    "46": "Invalid Destination Account Number",
    "47": "Your Card Cannot Be Used For Transactions",
    "48": "Warm Card: Restricted Access Rights",
    "49": "Invalid PIN / Password",
    "50": "Maximum Trying Over PIN",
    "51": "Transaction Exceeds Account Limitation Limits",
    "52": "Transaction Exceeds Allowed Limit",
    "56": "No Destination Bank",
    "60": "Invalid Phone Number",
    "61": "There Are Arrears Before This Month's Bill",
    "62": "Incorrect Customer Code Entered",
    "63": "Bill Not Available",
    "64": "Bill Already Paid",
    "30": "Customer Not Found",
    "70": "Invalid Authentication",
    "80": "Data Not Found",
    "71": "Username Not Found",
    "72": "Username Not Active",
    "73": "Customer Not Active",
    "74": "Device Not Active",
    "75": "Invalid Old Password",
    "76": "Old and New Password Should Be Different",
    "77": "Invalid Old Mobile PIN",
    "78": "Old and new Mobile PIN Should Be Different",
    "79": "Invalid Customer",
    "7A": "Invalid OTP",
    "7B": "Invalid Token",
    "7E": "Device ID is not registered",
    "7F": "User is blocked",
    "81": "Invalid Request Data",
    "82": "Invalid Amount",
    "83": "Invalid Fee",
    "84": "Invalid Date/Time",
    "85": "Database Error",
    "86": "Account Number Already Registered",
    "8A": "Account statement not found",
  };

  //RESPONSE FLAG
  static const String FLAG_0 = '0';
  static const String FLAG_1 = '1';
  static const String FLAG_2 = '2';
  static const String FLAG_3 = '3';

  //TYPE REST API
  static const String GET = 'GET';
  static const String POST = 'POST';

  static const String ID = 'id';
  static const String EN = 'en';

  //Path URL
  static String requestKey = '/requestKeyActivationPost';
}

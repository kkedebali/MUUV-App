class CatMapper {
  static String getGenreName(String id) {
    switch (id) {
      case '14':
        return 'Fantastik';
      case '10751':
        return 'Aile';
      case '99':
        return 'Belgesel';
      case '28':
        return 'Aksiyon';
      case '12':
        return 'Macera';
      case '16':
        return 'Animasyon';
      case '35':
        return 'Komedi';
      case '80':
        return 'Suç';
      case '18':
        return 'Dram';
      case '27':
        return 'Korku';
      case '878':
        return 'Bilim Kurgu';
      case '53':
        return 'Gerilim';
      case '36':
        return 'Tarih';
      case 'Gizem':
        return '10402';
      case '10749':
        return 'Romantik';
      case '10752':
        return 'Savaş';
      case '37':
        return 'Vahşi Batı';
      default:
        return 'Film'; // Tanımlı olmayanlar için genel bir isim
    }
  }

  // ID listesini virgüllü stringe dönüştürür (Örn: "Aksiyon, Dram")
  static String getGenreList(List<String> ids) {
    if (ids.isEmpty) return 'Tür Yok';
    return ids.map((id) => getGenreName(id)).join(', ');
  }
}

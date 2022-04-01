String findIcon(String name, bool type) {
  if (type) {
    switch (name) {
      case "Clouds":
        return "assets/sunny.png";
        break;
      case "Rain":
        return "assets/rainy.png";
        break;
      case "Drizzle":
        return "assets/rainy.png";
        break;
      case "Thunderstorm":
        return "assets/thunder.png";
        break;
      case "Snow":
        return "assets/snow.png";
        break;
      default:
        return "assets/sunny.png";
    }
  } else {
    switch (name) {
      case "Clouds":
        return "assets/sunny_2d.png";
        break;
      case "Rain":
        return "assets/rainy_2d.png";
        break;
      case "Drizzle":
        return "assets/rainy_2d.png";
        break;
      case "Thunderstorm":
        return "assets/thunder_2d.png";
        break;
      case "Snow":
        return "assets/snow_2d.png";
        break;
      default:
        return "assets/sunny_2d.png";
    }
  }
}

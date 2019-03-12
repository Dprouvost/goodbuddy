import "bootstrap";
import { loadDynamicBannerText } from '../components/banner';
import {categoriesSelector} from '../components/social_images';
if (document.getElementById('banner-typed-text')) {
  loadDynamicBannerText();
}
import { buttons } from '../components/category';
if (document.querySelectorAll('.clickme').length > 0) {
  buttons();
}
// import { form } from '../components/category';
// form();

if (document.getElementById('category-selection')) {
  categoriesSelector()
}
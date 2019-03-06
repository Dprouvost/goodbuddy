import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Stronger Together"],
    typeSpeed: 80,
    loop: true
  });
};

export { loadDynamicBannerText };
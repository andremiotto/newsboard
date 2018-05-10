// aparentemente não está encontrando typed.js
import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Share News", "Share Knowledge"],
    startDelay: 2000,
    typeSpeed: 100,
    backDelay: 1000,
    backSpeed: 110,
  });
}

export { loadDynamicBannerText };

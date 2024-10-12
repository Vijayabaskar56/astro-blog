import type { PostHideElements } from '~/content/config';

export const Site = 'https://astro-blog-zozo.pages.dev';
export const SiteLanguage = 'en';
export const SiteTitle = 'Vijayabaskar Thoughts';
export const SiteDescription = 'Learn, Explore & Experience';
export const FooterDescription = '肆意闪耀';
export const AdminName = 'Vijayabaskar';
export const PageSize = 15;

// socialPlatform => userName
// check components/Header.astro socialConfig for more info
export const Socials: Record<string, Record<string, string>> = {
 mail: { url: 'mailto:vj2k02@gmail.com' },
 github: { url: 'https://github.com/Vijayabaskar56' },
 x: { url: 'https://x.com/baskar8143' },
 youtube: { url: 'https://youtube.com/@vijayabaskar56' },
 rss: { url: '/rss.xml' },
 // mastodon: { url: 'https://mastodon.social/@userName' },
 // facebook: { url: 'https://facebook.com/userName' },
 // instagram: { url: 'https://instagram.com/userName' },
 // telegram: { url: 'https://t.me/@userName' },
 // skype: { url: 'https://skype.com/userName' },
 // slack: { url: 'https://slack.com/userName' },
 // messenger: { url: 'https://messenger.com/userName' },
 // whatsapp: { url: 'https://whatsapp.com/userName' },
 // snapchat: { url: 'https://snapchat.com/userName' },
 // line: { url: 'https://line.com/userName' },
 // twitch: { url: 'https://twitch.com/userName' },
 // weibo: { url: 'https://weibo.com/userName' },
 // bilibili: { url: 'https://space.bilibili.com/userName' },
 // dingding: { url: 'https://dingtalk.com/userName' },
 // zhihu: { url: 'https://zhihu.com/userName' },
 // douban: { url: 'https://douban.com/userName' },
};

// doc: https://giscus.app
// data-theme is auto changed between noborder_light / noborder_gray
export const GiscusConfig: Record<string, string> = {
 'data-repo': 'Vijayabaskar56/astro-blog',
 'data-repo-id': 'R_kgDOM5bn0Q',
 'data-category': 'General',
 'data-category-id': 'DIC_kwDOLgobXc4Cd_N6',
 'data-mapping': 'pathname',
 'data-strict': '0',
 'data-reactions-enabled': '1',
 'data-emit-metadata': '0',
 'data-input-position': 'top',
 'data-lang': 'en',
 'data-loading': 'lazy',
 crossorigin: 'anonymous',
 async: '',
};

export type HideElements =
 | PostHideElements
 | 'logo'
 | 'search'
 | 'themeToggler'
 | 'siteDescription'
 | 'footerDescription';
// Always hide elements from site
export const Hide: HideElements[] = [];

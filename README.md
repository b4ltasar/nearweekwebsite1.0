# NEARWEEK Website

A modern, responsive website built with Jekyll for the NEARWEEK community. Features dark/light theme switching, interactive 3D carousel, and optimized performance.

## Features

- **Modern Design**: Clean, professional aesthetic with smooth animations
- **Theme Switching**: Dark/light mode with persistent user preference
- **Interactive Elements**: 3D merchandise carousel with touch support
- **Responsive Design**: Optimized for desktop, tablet, and mobile
- **Performance Optimized**: Fast loading with lazy loading and efficient CSS
- **Content Management**: Easy content updates via YAML data files

## Tech Stack

- **Jekyll**: Static site generator
- **GitHub Pages**: Hosting and deployment
- **CSS Custom Properties**: Modern theming system
- **Vanilla JavaScript**: No external dependencies
- **Semantic HTML**: Accessible and SEO-friendly

## Project Structure

```
testsite/
├── _data/                 # Content management
│   ├── cards.yml         # Cards marquee data
│   ├── feature.yml       # Merchandise carousel data
│   └── ...
├── _includes/            # Reusable components
│   ├── header.html       # Site header with navigation
│   ├── footer.html       # Site footer
│   ├── hero.html         # Hero section
│   ├── cards-marquee.html # Horizontal scrolling cards
│   └── feature-section.html # 3D merchandise carousel
├── _layouts/             # Page templates
│   └── default.html      # Main layout with theme system
├── assets/               # Static assets
│   └── styles.css        # Main stylesheet
├── images/               # Image assets
└── index.html           # Homepage
```

## Theme System

The website uses a sophisticated theme system with CSS custom properties:

- **Light Theme**: Clean white background with dark text
- **Dark Theme**: Dark background with light text
- **Video Switching**: Theme-specific video content
- **Persistent Storage**: User preference saved in localStorage

### CSS Variables
```css
:root {
  --bg: #ffffff;
  --text: #0a0a0a;
  --muted: #6b7280;
  --card: #ffffff;
  --border: rgba(0, 0, 0, 0.12);
  --accent: #0ea5e9;
}
```

## Key Components

### 1. Hero Section
- Large video background with theme switching
- Call-to-action with animated button
- Responsive text layout

### 2. Cards Marquee
- Horizontal scrolling card display
- Touch-friendly on mobile
- Pause on hover for desktop

### 3. Merchandise Carousel
- 3D perspective carousel
- Touch/swipe support on mobile
- Auto-rotation with manual override
- Clean background items (images only)

### 4. Blog Section
- Grid layout for blog posts
- Responsive card design
- Hover effects and transitions

## Getting Started

### Prerequisites
- Ruby 2.7+ (for Jekyll)
- Bundler gem

### Installation
```bash
# Clone the repository
git clone https://github.com/b4ltasar/testsite.git
cd testsite

# Install dependencies
bundle install

# Serve locally
bundle exec jekyll serve

# Open in browser
open http://localhost:4000
```

### Development
```bash
# Watch for changes
bundle exec jekyll serve --livereload

# Build for production
bundle exec jekyll build
```

## Content Management

### Adding New Cards
Edit `_data/cards.yml`:
```yaml
items:
  - title: "New Card"
    text: "Description"
    image: "/images/card-image.png"
    link: "https://example.com"
```

### Adding Merchandise
Edit `_data/feature.yml`:
```yaml
items:
  - title: "New Product"
    description: "Product description"
    image: "/images/product.png"
    link: "https://shop.example.com"
    button_text: "BUY NOW"
```

### Adding Blog Posts
Create new files in `_posts/` with Jekyll front matter.

## Customization

### Colors
Update CSS custom properties in `assets/styles.css`:
```css
:root {
  --accent: #your-color;
}
```

### Typography
Modify font families in the CSS variables section.

### Layout
Adjust spacing and sizing using the CSS custom properties system.

## Responsive Breakpoints

- **Mobile**: < 768px
- **Tablet**: 768px - 1024px
- **Desktop**: > 1024px

## JavaScript Features

### Theme Switching
- Automatic detection of system preference
- Manual toggle with persistent storage
- Video content switching based on theme

### Carousel Functionality
- 3D perspective transforms
- Touch/swipe gestures on mobile
- Keyboard navigation (arrow keys)
- Auto-rotation with pause on interaction

### Performance Optimizations
- Lazy loading for images
- Efficient event listeners
- Debounced resize handlers

## Deployment

The site is automatically deployed to GitHub Pages on every push to the `main` branch.

### Manual Deployment
```bash
# Build the site
bundle exec jekyll build

# Deploy to GitHub Pages
git add .
git commit -m "Deploy updates"
git push origin main
```

## Troubleshooting

### Common Issues

1. **Video not switching themes**
   - Check browser console for JavaScript errors
   - Verify video files exist in `/images/`

2. **Carousel not working**
   - Ensure JavaScript is enabled
   - Check for console errors

3. **Styles not loading**
   - Clear browser cache
   - Check file paths in `_layouts/default.html`

## License

This project is proprietary to NEARWEEK.

## Contributing

For internal development, please:
1. Create a feature branch
2. Make your changes
3. Test thoroughly
4. Submit a pull request

## Support

For technical issues, contact the development team.

---

**Built for the NEARWEEK community**
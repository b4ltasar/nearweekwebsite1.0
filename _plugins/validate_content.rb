# Content validation plugin for Jekyll
# Validates YAML data files against schema

module Jekyll
  class ContentValidator < Generator
    safe true
    priority :low

    def generate(site)
      return unless site.config['validate_content']
      
      validate_cards(site)
      validate_blog_posts(site)
    end

    private

    def validate_cards(site)
      cards = site.data['cards']
      return unless cards && cards['items']
      
      cards['items'].each_with_index do |card, index|
        validate_required_fields(card, ['title', 'text', 'image', 'link'], "cards[#{index}]")
        validate_image_path(card['image'], "cards[#{index}].image") if card['image']
      end
    end

    def validate_blog_posts(site)
      blog = site.data['blog']
      return unless blog && blog['posts']
      
      blog['posts'].each_with_index do |post, index|
        validate_required_fields(post, ['title', 'excerpt', 'date', 'author', 'link'], "blog.posts[#{index}]")
        validate_date_format(post['date'], "blog.posts[#{index}].date") if post['date']
        validate_image_path(post['image'], "blog.posts[#{index}].image") if post['image']
      end
    end

    def validate_required_fields(item, required_fields, context)
      required_fields.each do |field|
        unless item[field] && !item[field].to_s.strip.empty?
          Jekyll.logger.warn "Content Validation: Missing required field '#{field}' in #{context}"
        end
      end
    end

    def validate_image_path(image_path, context)
      unless image_path.start_with?('/images/')
        Jekyll.logger.warn "Content Validation: Image path should start with '/images/' in #{context}: #{image_path}"
      end
    end

    def validate_date_format(date, context)
      unless date.match?(/^\d{4}-\d{2}-\d{2}$/)
        Jekyll.logger.warn "Content Validation: Date should be in YYYY-MM-DD format in #{context}: #{date}"
      end
    end

    def validate_slug_format(slug, context)
      unless slug.match?(/^[a-z0-9-]+$/)
        Jekyll.logger.warn "Content Validation: Slug should contain only lowercase letters, numbers, and hyphens in #{context}: #{slug}"
      end
    end
  end
end



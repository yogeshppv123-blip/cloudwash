import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A), // Deep Slate
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1300),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Brand Column
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF818CF8),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(Icons.waves_rounded, color: Colors.white, size: 28),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              'Cloud Wash',
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Redefining premium garment care with technology and craftsmanship. Your wardrobe deserves nothing but the best.',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 16,
                            height: 1.8,
                          ),
                        ),
                        const SizedBox(height: 48),
                        Row(
                          children: [
                            _SocialButton(icon: Icons.facebook_rounded, color: const Color(0xFF3B82F6)),
                            const SizedBox(width: 12),
                            _SocialButton(icon: Icons.camera_alt_rounded, color: const Color(0xFFEC4899)),
                            const SizedBox(width: 12),
                            _SocialButton(icon: Icons.alternate_email_rounded, color: const Color(0xFF10B981)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 100),
                  
                  // Navigation Links
                  Expanded(
                    child: _FooterColumn(
                      title: 'EXPLORE',
                      links: [
                        {'label': 'Home', 'route': '/'},
                        {'label': 'About Us', 'route': '/about'},
                        {'label': 'Services', 'route': '/services'},
                        {'label': 'Membership', 'route': '/membership'},
                        {'label': 'Blog', 'route': '/blog'},
                      ],
                    ),
                  ),
                  
                  // Services Links
                  Expanded(
                    child: _FooterColumn(
                      title: 'SERVICES',
                      links: [
                        {'label': 'Dry Cleaning', 'route': '/services'},
                        {'label': 'Wash & Fold', 'route': '/services'},
                        {'label': 'Shoe Restoration', 'route': '/services'},
                        {'label': 'Leather Care', 'route': '/services'},
                        {'label': 'Steam Ironing', 'route': '/services'},
                      ],
                    ),
                  ),
                  
                  // Support Column
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CONTACT',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 32),
                        _ContactItem(icon: Icons.phone_rounded, text: '+91 98765 43210'),
                        const SizedBox(height: 20),
                        _ContactItem(icon: Icons.email_rounded, text: 'hello@cloudwash.com'),
                        const SizedBox(height: 20),
                        _ContactItem(
                          icon: Icons.location_on_rounded, 
                          text: 'Suite 402, Laundry Lane,\nBangalore, KA 560001',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.white.withOpacity(0.05),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '© 2025 Cloud Wash. Crafted with precision.',
                    style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 14),
                  ),
                  Row(
                    children: [
                      _MinimalLink('Privacy Policy'),
                      const SizedBox(width: 32),
                      _MinimalLink('Terms of Service'),
                      const SizedBox(width: 32),
                      _MinimalLink('Sitemap'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Map<String, String>> links;
  const _FooterColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _FooterLink(link['label']!),
        )).toList(),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  const _FooterLink(this.label);

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: _isHovered ? const Color(0xFF818CF8) : Colors.white.withOpacity(0.5),
          fontSize: 15,
          fontWeight: _isHovered ? FontWeight.bold : FontWeight.normal,
        ),
        child: Text(widget.label),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFF818CF8), size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15, height: 1.5),
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  const _SocialButton({required this.icon, required this.color});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          widget.icon,
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}

class _MinimalLink extends StatelessWidget {
  final String label;
  const _MinimalLink(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: Colors.white.withOpacity(0.3), fontSize: 13),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const CrabGatorApp());
}

class CrabGatorApp extends StatelessWidget {
  const CrabGatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrabGator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F766E),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF7FAF8),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 820;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 72 : 24,
                  vertical: isWide ? 36 : 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _Header(),
                    SizedBox(height: isWide ? 72 : 48),
                    isWide
                        ? const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: _HeroCopy()),
                              SizedBox(width: 56),
                              Expanded(child: _ProgressPanel()),
                            ],
                          )
                        : const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _HeroCopy(),
                              SizedBox(height: 36),
                              _ProgressPanel(),
                            ],
                          ),
                    const SizedBox(height: 56),
                    const _FeatureStrip(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: const Color(0xFF0F766E),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.school_outlined, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Text(
          'CrabGator',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: const Color(0xFF17201D),
              ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: const Text('Admin'),
        ),
      ],
    );
  }
}

class _HeroCopy extends StatelessWidget {
  const _HeroCopy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Learn with structure, momentum, and clarity.',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w800,
                height: 1.08,
                color: const Color(0xFF17201D),
              ),
        ),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            'CrabGator is becoming your multiplatform learning space for courses, lessons, progress tracking, and guided practice.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  height: 1.45,
                  color: const Color(0xFF52615C),
                ),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow_rounded),
              label: const Text('Start Learning'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_rounded),
              label: const Text('Follow Progress'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ProgressPanel extends StatelessWidget {
  const _ProgressPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 340),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1E8E5)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 28,
            offset: Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: const Color(0xFF0F766E),
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 16),
          const _LessonTile(
            icon: Icons.menu_book_outlined,
            title: 'Foundation lesson',
            subtitle: 'Course structure and first concepts',
            progress: 0.72,
          ),
          const SizedBox(height: 14),
          const _LessonTile(
            icon: Icons.psychology_alt_outlined,
            title: 'Practice session',
            subtitle: 'Short quiz and active recall',
            progress: 0.44,
          ),
          const SizedBox(height: 22),
          ClipRRect(
            borderRadius: BorderRadius.circular(999),
            child: const LinearProgressIndicator(
              value: 0.58,
              minHeight: 10,
              backgroundColor: Color(0xFFE7EFEC),
              valueColor: AlwaysStoppedAnimation(Color(0xFF0F766E)),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '58% weekly progress',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF52615C),
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}

class _LessonTile extends StatelessWidget {
  const _LessonTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.progress,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAF8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF0F766E)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF17201D),
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: const Color(0xFF52615C),
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '${(progress * 100).round()}%',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF17201D),
                ),
          ),
        ],
      ),
    );
  }
}

class _FeatureStrip extends StatelessWidget {
  const _FeatureStrip();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: const [
        _FeaturePill(icon: Icons.layers_outlined, label: 'Courses'),
        _FeaturePill(icon: Icons.check_circle_outline, label: 'Progress'),
        _FeaturePill(icon: Icons.quiz_outlined, label: 'Quizzes'),
        _FeaturePill(icon: Icons.phone_iphone_outlined, label: 'Multiplatform'),
      ],
    );
  }
}

class _FeaturePill extends StatelessWidget {
  const _FeaturePill({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE1E8E5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: const Color(0xFF0F766E)),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ],
      ),
    );
  }
}

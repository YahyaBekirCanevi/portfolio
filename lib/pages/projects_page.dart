import 'package:flutter/material.dart';
import 'package:portfolio_page/launch_url.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  String selectedCategory = 'All';

  final List<Map<String, String>> allProjects = [
    {
      "title": "Backend Project",
      "category": "Backend",
      "github": "https://github.com/backend_project"
    },
    {
      "title": "Frontend Project",
      "category": "Frontend",
      "github": "https://github.com/frontend_project"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProjects = allProjects.where((project) {
      if (selectedCategory == 'All') return true;
      return project['category'] == selectedCategory;
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          DropdownButton<String>(
            value: selectedCategory,
            onChanged: (newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: ['All', 'Frontend', 'Backend']
                .map((category) => DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProjects.length,
              itemBuilder: (context, index) {
                final project = filteredProjects[index];
                return Card(
                  child: ListTile(
                    title: Text(project['title']!),
                    onTap: () {
                      launchURL(project['github']);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

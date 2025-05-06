import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // This would be your actual backend API URL
  static const String _baseUrl = 'https://your-backend-api.com';
  
  // Mock data for simulating backend responses
  final List<Map<String, dynamic>> _mockNotices = [
    {
      'id': 1,
      'title': 'Final Exam Schedule',
      'content': 'Final exams will be held from May 15-20. Please check the university portal for your specific exam times and locations.',
      'date': '2023-05-01',
      'keywords': ['exam', 'final', 'schedule', 'test']
    },
    {
      'id': 2,
      'title': 'Registration for Fall Semester',
      'content': 'Registration for the Fall 2023 semester will open on July 1st. Priority registration for seniors begins June 25th.',
      'date': '2023-06-15',
      'keywords': ['registration', 'fall', 'semester', 'enroll']
    },
    {
      'id': 3,
      'title': 'Library Hours Extended',
      'content': 'The university library will extend its hours during finals week. The library will be open 24/7 from May 10-20.',
      'date': '2023-05-05',
      'keywords': ['library', 'hours', 'finals', 'study']
    },
    {
      'id': 4,
      'title': 'Scholarship Application Deadline',
      'content': 'The deadline for applying to university scholarships for the next academic year is March 15th. Apply through the financial aid portal.',
      'date': '2023-02-20',
      'keywords': ['scholarship', 'deadline', 'financial aid', 'application']
    },
    {
      'id': 5,
      'title': 'Campus Closure - Holiday',
      'content': 'The university campus will be closed on Monday, February 20th for Presidents\' Day. Classes will resume on Tuesday, February 21st.',
      'date': '2023-02-15',
      'keywords': ['closure', 'holiday', 'campus', 'closed']
    },
  ];

  // Mock method to fetch initial data from backend
  Future<void> fetchInitialData() async {
    // In a real app, you would make an HTTP request to your backend
    // For now, we'll just simulate a delay
    await Future.delayed(const Duration(seconds: 1));
    
    // No need to return anything as we're just simulating the API call
  }

  // Method to get response from backend based on user query
  Future<String> getResponse(String query) async {
    // In a real app, you would make an HTTP request to your backend
    // For example:
    /*
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/api/query'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'query': query}),
      );
      
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'];
      } else {
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error communicating with backend: $e');
    }
    */
    
    // For now, we'll simulate a backend response
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Convert query to lowercase for case-insensitive matching
    final lowerQuery = query.toLowerCase();
    
    // Check if query matches any of our mock notices
    for (final notice in _mockNotices) {
      final keywords = notice['keywords'] as List<String>;
      final title = (notice['title'] as String).toLowerCase();
      final content = (notice['content'] as String).toLowerCase();
      
      if (keywords.any((keyword) => lowerQuery.contains(keyword)) ||
          title.contains(lowerQuery) ||
          lowerQuery.contains(title) ||
          content.contains(lowerQuery)) {
        
        return """
Based on our academic notices:

**${notice['title']}**
${notice['content']}
Date: ${notice['date']}

Is there anything specific about this notice you'd like to know?
""";
      }
    }
    
    // Default response if no match is found
    if (lowerQuery.contains('exam') || lowerQuery.contains('test')) {
      return "I don't have specific information about that exam. Please check the university portal or contact your professor for details.";
    } else if (lowerQuery.contains('class') || lowerQuery.contains('course')) {
      return "For specific class information, please check your course syllabus or the university's course management system.";
    } else if (lowerQuery.contains('deadline') || lowerQuery.contains('due')) {
      return "I don't have information about that specific deadline. You might want to check the academic calendar on the university website.";
    } else {
      return "I don't have information about that topic in my current database. Please check the university website or contact the relevant department for assistance.";
    }
  }
}

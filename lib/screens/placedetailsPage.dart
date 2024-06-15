import 'package:flutter/material.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final int rating;
  final String hours;
  final String days;
  final String category;

  const PlaceDetailsScreen({
    Key? key,
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.hours,
    required this.days,
    required this.category,
  }) : super(key: key);

  @override
  _PlaceDetailsScreenState createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, 
        children: [
          Stack(
            children: [
              Image.asset(
                widget.image, 
                height: 350,
                width: double.infinity, 
                fit: BoxFit.cover, 
              ),
              Positioned(
                top: 35,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(1), 
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                ),
              ),
              Positioned(
                top: 35,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(1),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    onPressed: () {

                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name, 
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Rating: ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${widget.rating}', 
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(widget.description),
                SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      'Open Days:  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.days}', 
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Open Hours:  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${widget.hours}', 
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, 
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Get location',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        
                      },
                      icon: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Add to Visited',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

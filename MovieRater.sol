pragma solidity ^0.5.16;

contract MovieRater {

	// number of movies in theatres
	uint public numMovies;

	struct Movie {
		string name;
		uint numRatings;
		uint totalScore;
	}

	// Add general movies by default
	constructor() public {
		addMovie("James Bond");
		addMovie("Avengers");
		addMovie("Star Wars");
	}

	// Get movies
	mapping(string => Movie) public movies;

	// Get raters, list of movies they've rated
	mapping(address => mapping(string => bool)) public ratings;

	/**
	 * Add a new movie to the ratings board.
	 * @param _name: name of the movie
	*/
	function addMovie(string memory _name) private {
		numMovies++;
		movies[_name] = Movie(_name, 0, 0);
	}


	/**
	 * Add rating to a movie
	 * @param _name: name of the movie to rate
	 * @param _score: score of 1 - 5 received by the movie
	 */
	function addRating(string memory _name, uint _score) public {

		require(!ratings[msg.sender][_name]);
		require(_score >= 1 && _score <= 5);

		// keep track the rater has rated this movie
		ratings[msg.sender][_name] = true;

		// update ratings
		movies[_name].numRatings++;
		movies[_name].totalScore += _score;
		
	}

	/**
	 * Get rating of a movie.
	 * @param _name: name of the movie 
	 */
	function getRating(string memory _name) public returns (uint) {
		return movies[_name].numRatings == 0 ? 0 :
				 movies[_name].totalScore / movies[_name].numRatings;
	}

}

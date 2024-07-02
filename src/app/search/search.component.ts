import { Component } from '@angular/core';
import { MoviesService } from '../services/movies.service';
import { BooksService } from '../services/books.service';

@Component({
  selector: 'app-search',
  templateUrl: './search.component.html',
  styleUrls: ['./search.component.css']
})
export class SearchComponent {
  searchType: string = 'movie'; // 'movie' or 'book'
  query: string = '';
  results: any = null;

  constructor(
    private moviesService: MoviesService,
    private booksService: BooksService
  ) {}

  search() {
    if (this.searchType === 'movie') {
      this.moviesService.searchMovie(this.query).subscribe(
        (data) => (this.results = data),
        (error) => console.error(error)
      );
    } else if (this.searchType === 'book') {
      this.booksService.searchBook(this.query).subscribe(
        (data) => (this.results = data),
        (error) => console.error(error)
      );
    }
  }
}

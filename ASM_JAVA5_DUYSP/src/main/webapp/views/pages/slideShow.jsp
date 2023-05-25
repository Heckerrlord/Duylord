<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.slideimg{
height: 400px;
object-fit: cover;
}
</style>
    <div class="slideshow">
    <div
      id="carouselExampleInterval"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
          <img
            src="https://wallpaperaccess.com/full/1150062.jpg"
            class="slideimg d-block w-100"
            alt="..."
          />
        </div>
        <div class="carousel-item" data-bs-interval="2000">
          <img
            src="https://mega.com.vn/media/news/0206_hinh-nen-MU-may-tinh59.jpg"
            class="slideimg d-block w-100"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="https://wallpapercave.com/wp/wp2548936.jpg" class="slideimg d-block w-100"
            alt="..."
          />
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleInterval"
        data-bs-slide="prev"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleInterval"
        data-bs-slide="next"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>
 
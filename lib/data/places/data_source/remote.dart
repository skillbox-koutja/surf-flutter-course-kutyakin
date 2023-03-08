import 'package:dio/dio.dart';
import 'package:places/data/places/data_source/place/edit/request.dart';
import 'package:places/data/places/data_source/place/new/request.dart';
import 'package:places/data/places/data_source/place/response.dart';
import 'package:places/data/places/data_source/place/search/request.dart';
import 'package:places/data/places/data_source/place/search/response.dart';
import 'package:retrofit/retrofit.dart';

part 'remote.g.dart';

@RestApi()
abstract class PlaceRemoteDataSource {
  factory PlaceRemoteDataSource(Dio dio) = _PlaceRemoteDataSource;

  @GET('/place')
  Future<List<PlaceDto>> getPlaces({
    @Query('count') int? count,
    @Query('offset') int? offset,
    @Query('sortBy') List<String>? sortBy,
  });

  @POST('/filtered_places')
  Future<List<SearchPlaceDto>> searchPlaces(
    @Body() SearchPlaceRequest request,
  );

  @GET('/place/{id}')
  Future<PlaceDto> getPlace(
      @Path('id') String id,
  );

  @PUT('/place/{id}')
  Future<PlaceDto> editPlace(
      @Path('id') String id,
      @Body() EditPlaceRequest request,
  );

  @POST('/place')
  Future<PlaceDto> createPlace(
      @Body() NewPlaceRequest request,
  );
}

import 'package:flutter/material.dart';
import 'package:ytrendd/models/country.dart';
import 'package:ytrendd/providers/countries_provider.dart';
import 'package:provider/provider.dart';

class SelectedCountryTile extends StatefulWidget {
  final Country country;

  SelectedCountryTile(this.country);

  @override
  _SelectedCountryTileState createState() => _SelectedCountryTileState();
}

class _SelectedCountryTileState extends State<SelectedCountryTile>
    with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    final tile = ListTile(
      leading: Checkbox(
        value: widget.country.selected,
        onChanged: (bool newValue) {
          Provider.of<CountriesProvider>(context, listen: false)
              .onSelectCountry(widget.country);
        },
      ),
      title: Text('${widget.country.emoji} ${widget.country.name}'),
      trailing: Icon(Icons.menu),
    );

    final dragTarget = DragTarget<Country>(
      onWillAccept: (sourceCountry) {
        return true;
      },
      onAccept: (sourceCountry) {
        Provider.of<CountriesProvider>(context, listen: false)
            .moveCountry(sourceCountry, widget.country);
      },
      builder: (BuildContext context, candidateData, rejectedData) {
        return Column(
          children: <Widget>[
            AnimatedSize(
              duration: Duration(milliseconds: 100),
              vsync: this,
              child: candidateData.isEmpty
                  ? Container()
                  : Opacity(
                      opacity: 0.0,
                      child: tile,
                    ),
            ),
            Card(
              child: tile,
            )
          ],
        );
      },
    );

    return LongPressDraggable<Country>(
      data: widget.country,
      axis: Axis.vertical,
      maxSimultaneousDrags: 1,
      child: dragTarget,
      childWhenDragging: Container(),
      feedback: Material(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: tile,
        ),
        elevation: 4.0,
      ),
    );
  }
}
